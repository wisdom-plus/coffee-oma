require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  let(:user) { create(:user)}
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test2') }
  let(:notification) {create(:notification, visitor: user, visited: user1,action: "follow")}

  describe "GET /index" do
    before do
      user.confirm
      sign_in user
    end

    it "request success" do
      get notifications_path
      expect(response).to have_http_status(:ok)
    end
  end

end
