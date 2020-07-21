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
    end
  end
end
