require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  let(:user) { create(:user) }

  describe 'sign_in' do
    context 'when success' do
      before do
        user.confirm
        visit new_user_session_path
        fill_in 'E-mail address', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end

      it 'successfully login' do
        expect(page).to have_content 'ログインしました。'
      end
    end

    context 'when fail' do
      it 'is wrong passowrd' do
        user.confirm
        visit new_user_session_path
        fill_in 'E-mail address', with: user.email
        fill_in 'Password', with: 'wrongpassword'
        click_button 'Log in'
        expect(page).to have_content 'Eメールまたはパスワードが違います。'
      end

      it 'is wrong email' do
        user.confirm
        visit new_user_session_path
        fill_in 'E-mail address', with: 'wrong@example.com'
        fill_in 'Password', with: user.password
        click_button 'Log in'
        expect(page).to have_content 'Eメールまたはパスワードが違います。'
      end
    end
  end

  describe 'sign_out' do
    before do
      user.confirm
      visit new_user_session_path
      fill_in 'E-mail address', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    it 'is successfully sign_out' do
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました。'
    end
  end
end
