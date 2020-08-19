require 'rails_helper'

RSpec.describe 'Registrations', type: :system do
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test2') }

  describe 'registrations' do
    describe 'sign_up' do
      context 'sign_up(success)' do
        before do
          visit new_user_registration_path
          fill_in 'user-name', with: 'test1'
          fill_in 'E-mail address', with: 'test@example.com'
          fill_in 'Password', with: 'kajshdjduidj'
          fill_in 'Confirmation password', with: 'kajshdjduidj'
          click_button 'Sign up'
        end

        it 'success sign_up' do
          expect(page).to have_content '本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。'
        end
      end

      context 'sign_up(failure)' do
        before do
          visit new_user_registration_path
        end

        it 'password is short' do
          fill_in 'user-name', with: 'test1'
          fill_in 'E-mail address', with: 'test@example.com'
          fill_in 'Password', with: 'test'
          fill_in 'Confirmation password', with: 'test'
          click_button 'Sign up'
          expect(page).to have_content '新規登録'
        end

        it 'confirmation password is incorrect' do
          fill_in 'user-name', with: 'test1'
          fill_in 'E-mail address', with: 'test@example.com'
          fill_in 'Password', with: 'kajshdjduidj'
          fill_in 'Confirmation password', with: 'password'
          click_button 'Sign up'
          expect(page).to have_content '新規登録'
        end
      end
    end

    describe 'delete /users' do
      context 'delete users_registration_path' do
        before do
          login(user, user.email, user.password)
        end

        it 'delete seccess' do
          visit edit_user_registration_path
          click_on :delete_button
          expect(page).to have_content 'アカウントを削除しました。またのご利用をお待ちしております。'
        end
      end
    end

    describe 'get /users/edit' do
      before do
        login(user, user.email, user.password)
        visit edit_user_registration_path
      end

      context 'edit(seccess)' do
        it 'displayed icon ' do
          expect(page).to have_selector '#img_prev'
        end

        it 'user edit seccess(username)' do
          fill_in 'spec-user-name', with: 'test'
          fill_in 'spec-E-mail address', with: user.email
          click_button 'Update'
          expect(page).to have_content 'アカウント情報を変更しました。'
        end

        it 'user edit seccess(email)' do
          fill_in 'spec-user-name', with: 'test1'
          fill_in 'spec-E-mail address', with: 'test1@example.com'
          click_button 'Update'
          expect(page).to have_content 'アカウント情報を変更しました。'
        end

        it 'user edit seccess(password)' do
          fill_in 'spec-password', with: "password"
          fill_in 'spec-password-confirmation', with: "password"
          click_button 'Update'
          expect(page).to have_content 'アカウント情報を変更しました。'
        end
      end
    end

    describe 'get /users/:id/show' do
      context 'signed' do
        before do
          login(user, user.email, user.password)
        end

        it 'displayed icon ' do
          visit "/users/#{user.id}/show"
          expect(page).to have_selector 'img'
        end

        it 'success render(user)' do
          visit "/users/#{user.id}/show"
          expect(page).to have_content user.username.to_s
        end

        it 'success have link edit' do
          visit "/users/#{user.id}/show"
          expect(page).to have_link 'プロフィールを編集'
        end

        it 'success render(user1)' do
          visit "/users/#{user1.id}/show"
          expect(page).to have_content user1.username.to_s
        end

        it 'not have link edit' do
          visit "/users/#{user1.id}/show"
          expect(page).to have_no_link edit_user_registration_path
        end
      end

      context 'not signed' do
        it 'not have link edit' do
          visit "/users/#{user.id}/show"
          expect(page).to have_no_link edit_user_registration_path
        end
      end
    end
  end
end
