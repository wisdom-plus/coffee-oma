require 'rails_helper'

RSpec.describe 'Api::Auth::Passwords', type: :request do
  let(:user) { create(:user) }

  describe 'POST /api/auth/password' do
    it 'レスポンス成功' do
      post api_v1_user_password_path, params: { email: user.email }
      expect(response).to have_http_status(:ok)
    end

    it 'レスポンス失敗' do
      post api_v1_user_password_path, params: { email: nil }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
