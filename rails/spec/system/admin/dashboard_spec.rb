require 'rails_helper'

RSpec.describe 'Admin dashboard', type: :system do
  let(:admin) { create(:admin_user) }

  describe 'dashboard' do
    context 'when logged in' do
      before do
        admin_login(admin)
        visit admin_root_path
      end

      it 'display dashborad' do
        expect(page).to have_content 'ダッシュボード'
        expect(page).to have_current_path admin_root_path
      end
    end

    context 'when not logged in' do
      it 'login success' do
        visit new_admin_user_session_path
        fill_in 'メールアドレス', with: admin.email
        fill_in 'パスワード', with: admin.password
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end

      it 'after sign in page' do
        visit new_admin_user_session_path
        fill_in 'メールアドレス', with: admin.email
        fill_in 'パスワード', with: admin.password
        click_button 'ログイン'
        expect(page).to have_current_path admin_root_path
      end
    end
  end
end
