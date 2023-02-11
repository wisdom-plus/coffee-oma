require 'rails_helper'

RSpec.describe 'Auth::Registrations', type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:headers) { api_sign_in(user) }

  describe 'GET /api/auth/registrations/:id' do
    it 'レスポンス成功' do
      get "/api/v1/auth/registrations/#{user.id}", headers: headers
      expect(response).to have_http_status(:ok)
    end

    it 'レスポンス失敗' do
      get '/api/v1/auth/registrations/0', headers: headers
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'PUT /api/auth/registrations/:id' do
    context 'ログインしている時' do
      it 'レスポンス成功' do
        put api_v1_user_registration_path, params: { registration: { username: 'testuser' } }, headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'レスポンス成功(パスワード)' do
        put api_v1_user_registration_path, params: { registration: { username: 'testuser', password: 'password', password_confirmation: 'password' } }, headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'レスポンス失敗' do
        put api_v1_user_registration_path, params: { registration: { username: '' } }, headers: headers
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'ログインしていない時' do
      it 'レスポンス失敗' do
        put api_v1_user_registration_path, params: { registration: { username: 'testuser' } }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
