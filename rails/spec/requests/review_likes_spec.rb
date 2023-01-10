require 'rails_helper'

RSpec.describe 'ReviewLikes', type: :request do
  let_it_be(:user) { create(:user) }
  let_it_be(:product) { create(:product, user: user) }
  let_it_be(:bean) { create(:bean, user: user) }
  let_it_be(:review) { create(:review, user: user, product: product) }
  let_it_be(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:product_review_like) { create(:like, user: user, liked_id: review.id, type: 'ProductReviewLike') }
  let(:bean_review_like) { create(:like, user: user, liked_id: bean_review.id, type: 'BeanReviewLike') }

  describe 'POST /create' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success(product)' do
      post review_likes_path, params: { review_id: review.id, type: 'Review' }, xhr: true
      expect(response).to have_http_status(:see_other)
    end

    it 'created like success(product)' do
      expect do
        post review_likes_path, params: { review_id: review.id, type: 'Review' }, xhr: true
      end.to change(ProductReviewLike, :count).by 1
    end

    it 'request success(bean)' do
      post review_likes_path, params: { review_id: bean_review.id, type: 'BeanReview' }, xhr: true
      expect(response).to have_http_status(:see_other)
    end

    it 'created like success(bean)' do
      expect do
        post review_likes_path, params: { review_id: bean_review.id, type: 'BeanReview' }, xhr: true
      end.to change(BeanReviewLike, :count).by 1
    end
  end

  describe 'DETELE /destroy' do
    before do
      user.confirm
      sign_in user
    end

    it 'returns http success(prodcut)' do
      delete review_like_path(product_review_like.id, type: 'ProductReviewLike'), xhr: true
      expect(response).to have_http_status(:see_other)
    end

    it 'destroy like success(product)' do
      product_review_like
      expect do
        delete review_like_path(product_review_like.id, type: 'ProductReviewLike'), xhr: true
      end.to change(ProductReviewLike, :count).by(-1)
    end

    it 'returns http success(bean)' do
      delete review_like_path(bean_review_like.id, type: 'BeanReviewLike'), xhr: true
      expect(response).to have_http_status(:see_other)
    end

    it 'destroy like success(bean)' do
      bean_review_like
      expect do
        delete review_like_path(bean_review_like.id, type: 'BeanReviewLike'), xhr: true
      end.to change(BeanReviewLike, :count).by(-1)
    end
  end
end
