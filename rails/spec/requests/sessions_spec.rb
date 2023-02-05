require 'rails_helper'

RSpec.describe 'Sessions' do
  let_it_be(:user) { create(:user) }

  describe 'GET users/sign_in' do
    it 'request success' do
      get new_user_session_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST users/sign_in' do
    it 'request success' do
      user.confirm
      post user_session_path, params: { user: { email: user.email, password: user.password, remember_me: '0' } }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'DELELTE users/sign_out' do
    it 'requests success' do
      user.confirm
      sign_in user
      delete destroy_user_session_path
      expect(response).to have_http_status(:found)
    end
  end
end
