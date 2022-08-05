require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test2') }
  let(:follow) { create(:relationship, user: user, follow: user1) }
  let(:notification) { create(:notification, user: user, source: follow) }

  describe 'Notification' do
    before do
      user
      user1
      sign_in admin
    end

    it 'created resource' do
      expect do
        post admin_notifications_path, params: { notification: attributes_for(:notification, user_id: user.id, source_id: follow.id, source_type: 'Relationship') }
      end.to change(Notification, :count).by 1
    end
  end
end
