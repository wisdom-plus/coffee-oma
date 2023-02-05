require 'rails_helper'

RSpec.describe 'Passwords' do
  let(:user) { create(:user) }

  describe 'GET users/password/new' do
    it 'request seccess' do
      get new_user_password_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET users/password/edit' do
    before do
      @raw, enc = Devise.token_generator.generate(User, :reset_password_token)

      user.reset_password_token   = enc
      user.reset_password_sent_at = (4.hours.ago)
      user.save(validate: false)
    end

    it 'rquest seccess' do
      get edit_user_password_path(@resources, reset_password_token: @raw)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST users/password' do
    it 'request seccess' do
      post user_password_path, params: { user: { email: user.email } }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'PATCH users/password' do
    before do
      @raw, enc = Devise.token_generator.generate(User, :reset_password_token)

      user.reset_password_token   = enc
      user.reset_password_sent_at = (4.hours.ago)
      user.save(validate: false)
    end

    it 'requests seccess' do
      patch user_password_path, params: { user: { reset_password_token: @raw, password: 'password', password_confirmation: 'password' } }
      expect(response).to have_http_status(:found)
    end
  end
end
