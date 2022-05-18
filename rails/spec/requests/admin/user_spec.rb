require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }

  describe 'User' do
    before do
      sign_in admin
    end

    it 'created resource' do
      expect do
        post admin_users_path, params: { user: {email: 'test@example.com', username: 'test',password: 'password',password_confirmation: 'password'} }
      end.to change(User, :count).by 1
    end
  end
end
