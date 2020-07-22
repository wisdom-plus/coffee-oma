require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
  let(:user) {create(:user)}

  describe "registrations" do
    describe "sign_up" do
      context "sign_up(success)" do
        before do
          visit new_user_registration_path
          fill_in "user-name", with: "test1"
          fill_in "E-mail address", with: "test@example.com"
          fill_in "Password", with: "kajshdjduidj"
          fill_in "Confirmation password", with: "kajshdjduidj"
          click_button "Sign up"
        end

        it "success sign_up" do
          expect(page).to have_content '本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。'
        end
      end

      context "sign_up(failure)" do
        before do
          visit new_user_registration_path
        end

        it "password is short" do
          fill_in "user-name", with: "test1"
          fill_in "E-mail address", with: "test@example.com"
          fill_in "Password", with: "test"
          fill_in "Confirmation password", with: "test"
          click_button "Sign up"
          expect(page).to have_content "新規登録"
        end

        it "confirmation password is incorrect" do
          fill_in "user-name", with: "test1"
          fill_in "E-mail address", with: "test@example.com"
          fill_in "Password", with: "kajshdjduidj"
          fill_in "Confirmation password", with: "password"
          click_button "Sign up"
          expect(page).to have_content "新規登録"
        end
      end
    end
    describe "delete users/registration" do
      context "delete users_registration_path" do
        before do
          login(user,user.email,user.password)
        end

        it "delete seccess" do
          visit edit_user_registration_path
          click_on :delete_button
          expect(page).to have_content "アカウントを削除しました。またのご利用をお待ちしております。"
        end
      end
    end

    describe "get edit/registrstion" do
      before do
        login(user,user.email,user.password)
        visit edit_user_registration_path
      end
      context "edit(seccess)" do
        it "user edit seccess" do
          fill_in "spec-user-name",with: "test"
          fill_in "spec-E-mail address",with: user.email
          click_button "Update"
          expect(page).to have_content "アカウント情報を変更しました。"
        end
      end
    end
  end
end
