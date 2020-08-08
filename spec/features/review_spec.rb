require 'rails_helper'

RSpec.feature "Reviews", type: :feature do
  let(:user) {create(:user)}
  let(:product) { create(:product)}
  let(:review) { create(:review, user: user, product: product)}

  describe 'review' do
    describe 'index' do
      before do
        visit product_reviews_path(product.id)
      end

      it 'render page' do
        expect(page).to have_current_path product_reviews_path(product.id)
      end
    end

    describe 'create' do
      before do
        login(user, user.email, user.password)
        visit product_path(product.id)
      end

      it 'redirect page' do
        fill_in "タイトル",	with: "コーヒー器具のタイトル"
        fill_in "レビュー内容",	with: "コーヒー器具の内容"
        click_button "  submit  "
        expect(page).to have_content "アイテムの詳細"
      end
    end
  end
end
