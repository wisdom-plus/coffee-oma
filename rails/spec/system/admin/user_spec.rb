require 'rails_helper'

RSpec.describe 'Admin user', type: :system do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test1') }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user, product: product) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:product_review_like) { create(:like, user: user, liked_id: review.id, type: 'ProductReviewLike') }
  let(:bean_review_like) { create(:like, user: user, liked_id: bean_review.id, type: 'BeanReviewLike') }

  describe 'user' do
    before do
      admin_login(admin)
      product_review_like
      bean_review_like
      visit admin_users_path
    end

    it 'displayed index' do
      expect(page).to have_content 'ユーザー'
    end

    it 'displayed show' do
      visit admin_user_path(user.id)
      expect(page).to have_content user.username
      expect(page).to have_content review.title
      expect(page).to have_content bean_review.title
      expect(page).to have_content bean_review_like.id
      expect(page).to have_content product_review_like.id
    end

    it 'delete resource' do
      expect do
        visit admin_user_path(user.id)
        click_on 'ユーザー を削除する'
      end.to change(User, :count).by(-1)
    end
  end
end