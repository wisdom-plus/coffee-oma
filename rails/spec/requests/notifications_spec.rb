require 'rails_helper'

RSpec.describe 'Notifications' do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:follow) { create(:relationship, user: user, follow: user) }
  let(:notification) { create(:notification, source: follow, user: user) }

  describe 'GET /index' do
    it 'request success' do
      user.confirm
      sign_in user
      get notifications_path
      expect(response).to have_http_status(:ok)
    end
  end
end
