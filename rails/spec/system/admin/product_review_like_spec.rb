require 'rails_helper'

RSpec.describe 'Admin product_review_like', type: :system do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user, product: product) }
  let(:product_review_like) { create(:like, user: user, liked_id: review.id, type: 'ProductReviewLike') }

  describe 'product_review_like' do
    before do
      admin_login(admin)
      product_review_like
      visit admin_product_review_likes_path
    end

    it 'displayed index' do
      expect(page).to have_content '商品レビューお気に入り'
    end

    it 'displayed show' do
      visit admin_product_review_like_path(product_review_like.id)
      expect(page).to have_content user.username
    end

    it 'delete resource' do
      expect do
        visit admin_product_review_like_path(product_review_like.id)
        click_on '商品レビューお気に入り を削除する'
      end.to change(ProductReviewLike, :count).by(-1)
    end
  end
end
