require 'rails_helper'

RSpec.describe 'Admin user', type: :system do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
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

    it 'created user' do
      expect do
        visit new_admin_user_path
        fill_in 'user_email', with: 'test1@example.com'
        fill_in 'user_username', with: 'test1'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_on 'ユーザーを作成'
      end.to change(User, :count).by(1)
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
