require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test2') }
  let(:notification) { create(:notification, visitor: user, visited: user1, action: 'follow') }

  describe 'Notification' do
    before do
      user
      user1
      sign_in admin
    end

    it 'created resource' do
      expect do
        post admin_notifications_path, params: { notification: attributes_for(:notification, visitor_id: user.id, visited: user1.id, action: 'follow') }
      end.to change(Notification, :count).by 1
    end
  end
end
