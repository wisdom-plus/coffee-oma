require 'rails_helper'

RSpec.describe 'Admin' do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }

  describe 'Bean' do
    it 'created resource' do
      user
      sign_in admin
      expect do
        post admin_beans_path, params: { bean: attributes_for(:bean, user_id: user.id) }
      end.to change(Bean, :count).by 1
    end
  end
end
