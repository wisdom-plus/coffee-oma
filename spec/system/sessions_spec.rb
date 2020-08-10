require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  let(:user) { create(:user) }

  describe 'sessions' do
    describe 'sign_in' do
      context 'sign_in(success)' do
        before do
          login(user, user.email, user.password)
        end

        it 'success sign_in' do
          expect(body).to have_content 'ログインしました。'
        end
      end

      context 'sign_in(failure)' do
        it 'wrong passowrd' do
          login(user, user.email, 'password')
          expect(page).to have_content 'Eメールまたはパスワードが違います。'
        end

        it 'wrong email' do
          login(user, 'test123@example.com', user.password)
          expect(page).to have_content 'Eメールまたはパスワードが違います。'
        end
      end
    end

    describe 'sign_out' do
      context 'sign_out' do
        before do
          login(user, user.email, user.password)
        end

        it 'success sign_out' do
          click_on 'ログアウト'
          expect(page).to have_content 'ログアウトしました。'
        end
      end
    end
  end
end
