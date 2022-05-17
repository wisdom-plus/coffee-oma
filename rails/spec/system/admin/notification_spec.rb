require 'rails_helper'

RSpec.describe 'Admin Notifications', type: :system do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test2@example.com', username: 'test2') }
  let(:product) { create(:product, user: user) }
  let(:notification_follow) { create(:notification, visitor: user1, visited: user, action: 'follow') }

  describe 'notification' do
    before do
      admin_login(admin)
      notification_follow
      notification_like
      notification_message
      visit admin_notifications_path
    end

    it 'displayed index' do
      expect(page).to have_content '通知'
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
