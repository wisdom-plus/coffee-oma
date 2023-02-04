require 'rails_helper'

RSpec.describe 'Admin' do
  let(:admin) { create(:admin_user) }

  describe 'User' do
    it 'created resource' do
      sign_in admin
      expect do
        post admin_users_path, params: { user: { email: 'test@example.com', username: 'test', password: 'password', password_confirmation: 'password' } }
      end.to change(User, :count).by 1
    end
  end
end
