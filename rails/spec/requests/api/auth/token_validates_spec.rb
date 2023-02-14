require 'rails_helper'

RSpec.describe 'Api::Auth::TokenValidates' do
  let(:user) { create(:user) }
  let(:headers) { api_sign_in(user) }

  describe 'GET /api/auth/validate_token' do
    it 'レスポンス成功' do
      get api_v1_auth_validate_token_path, headers: headers
      expect(response).to have_http_status(:ok)
    end

    it 'レスポンス失敗' do
      get api_v1_auth_validate_token_path
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
