require 'rails_helper'

RSpec.describe 'Admin dashboard' do
  let!(:admin) { create(:admin_user) }

  describe 'dashboard' do
    context 'when logged in' do
      it 'display dashborad' do
        admin_login(admin)
        visit admin_root_path
        expect(page).to have_content 'ダッシュボード'
        expect(page).to have_current_path admin_root_path
      end
    end

    context 'when not logged in after sign in page' do
      it 'login success' do
        visit new_admin_user_session_path
        fill_in 'メールアドレス', with: admin.email
        fill_in 'パスワード', with: admin.password
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
        expect(page).to have_current_path admin_root_path
      end
    end
  end
end
