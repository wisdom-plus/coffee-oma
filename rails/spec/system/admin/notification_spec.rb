require 'rails_helper'

RSpec.describe 'Admin Notifications' do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:product) { create(:product, user: user) }
  let(:follow) { create(:relationship, user: user, follow: user1) }
  let!(:notification_follow) { create(:notification, source: follow, user: user) }

  describe 'notification' do
    before do
      admin_login(admin)
      visit admin_notifications_path
    end

    it 'displayed index' do
      expect(page).to have_content '通知'
    end

    it 'created notification' do
      expect do
        visit new_admin_notification_path
        fill_in 'notification_user_id', with: user.id
        fill_in 'notification_source_id', with: follow.id
        fill_in 'notification_source_type', with: 'Relationship'
        uncheck 'notification_checked'
        click_on '通知を作成'
      end.to change(Notification, :count).by(1)
    end

    it 'displayed show(follow)' do
      visit admin_notification_path(notification_follow.id)
      expect(page).to have_content notification_follow.id
    end

    it 'delete resource' do
      expect do
        visit admin_notification_path(notification_follow.id)
        click_on '通知 を削除する'
      end.to change(Notification, :count).by(-1)
    end
  end
end
