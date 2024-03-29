require 'rails_helper'

RSpec.describe 'Registrations' do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:user_params) { attributes_for(:user, icon: File.open('./spec/support/test.png')) }
  let(:user_update_params) { attributes_for(:user, username: 'test', icon: File.open('./spec/support/test.png')) }

  describe 'GET /users/sign_up' do
    it 'request success' do
      get new_user_registration_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /users/edit' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success' do
      get edit_user_registration_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /users/:id/show' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success(user)' do
      get users_my_page_path
      expect(response).to have_http_status(:ok)
    end

    it 'request success(user1)' do
      get user_registration_show_path(user1.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /users' do
    before do
      ActionMailer::Base.deliveries.clear
    end

    it 'request success' do
      post user_registration_path, params: { user: user_params }
      expect(response).to have_http_status(:found)
    end

    it 'user created' do
      expect do
        post user_registration_path, params: { user: user_params }
      end.to change(User, :count).by 1
    end
  end

  describe 'DELETE /users' do
    before do
      user.confirm
      sign_in user
    end

    it 'requests success' do
      delete user_registration_path
      expect(response).to have_http_status(:found)
    end

    it 'user delete' do
      expect do
        delete user_registration_path
      end.to change(User, :count).by(-1)
    end
  end

  describe 'PATCH /users' do
    it 'request success' do
      patch user_registration_path, params: { user: user_update_params }
      expect(response).to have_http_status(:found)
    end
  end
end
