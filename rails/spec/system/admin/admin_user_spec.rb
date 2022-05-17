require 'rails_helper'

RSpec.describe 'Admin admin_user', type: :system do
  let(:admin) { create(:admin_user) }


  describe 'admin user' do
    before do
      admin_login(admin)
      visit admin_admin_users_path
    end

    it 'displayed index' do
      expect(page).to have_content '管理者'
    end

    it 'displayed new' do
      expect do
        visit new_admin_admin_user_path
        fill_in 'admin_user_email', with: 'admin_test@example.com'
        fill_in 'admin_user_password', with: 'adminpassword'
        fill_in 'admin_user_password_confirmation', with: 'adminpassword'
        click_on '管理者を作成'
      end.to change(AdminUser, :count).by(1)

    end

    it 'displayed show' do
      visit admin_admin_user_path(admin.id)
      expect(page).to have_content admin.email
    end

    it 'delete resource' do
      expect do
        visit admin_admin_user_path(admin.id)
        click_on '管理者 を削除する'
      end.to change(AdminUser, :count).by(-1)
    end
  end
end
