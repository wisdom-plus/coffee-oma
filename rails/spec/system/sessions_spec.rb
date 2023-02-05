require 'rails_helper'

RSpec.describe 'Sessions' do
  let(:user) { create(:user) }

  describe 'sign_in' do
    context 'when success' do
      it 'successfully login' do
        user.confirm
        visit new_user_session_path
        fill_in 'E-mail address', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
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
    it 'is successfully sign_out' do
      user.confirm
      visit new_user_session_path
      fill_in 'E-mail address', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      find('.spec-logout').click
      expect(page).to have_content 'ログアウトしました。'
    end
  end
end
