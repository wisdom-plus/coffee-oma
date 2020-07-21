require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) {create(:user)}

  describe "GET users/sign_in" do
    it "render sign_in" do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST users/sign_in" do
    before do
      user.confirm
      post user_session_path , params: {user: {email: 'test@example.com', password: 'kajshdjduidj', remember_me: '0'}}
    end

    it "redirect_to root" do
      expect(response).to have_http_status(302)
    end

  end

  describe "DELELTE users/sign_out" do
    before do
      user.confirm
      sign_in user
    end

    it "redirect_to root" do
      delete destroy_user_session_path
      expect(response).to have_http_status(302)
    end
  end
end
