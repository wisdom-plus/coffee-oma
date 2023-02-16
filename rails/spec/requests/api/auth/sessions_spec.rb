require 'rails_helper'

RSpec.describe 'Api::Auth::Sessions' do
  let(:guest) { create(:user, :guest) }

  describe 'GET /api/auth/guest_login' do
    it 'レスポンス成功' do
      get api_v1_auth_guest_login_path
      expect(response).to have_http_status(:ok)
    end

    it 'ユーザーが作成される' do
      expect do
        get api_v1_auth_guest_login_path
      end.to change(User, :count).by(1)
    end

    it 'レスポンス成功(ゲスト作成ずみ)' do
      guest
      get api_v1_auth_guest_login_path
      expect(response).to have_http_status(:found)
    end

    it 'ユーザーが作成されない(ゲスト作成ずみ)' do
      guest
      expect do
        get api_v1_auth_guest_login_path
      end.not_to change(User, :count)
    end
  end
end
