require 'rails_helper'

RSpec.describe 'ReviewLikes', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:review) { create(:review, user: user, product: product) }
  let(:review_like) { create(:review_like, user: user, review: review) }

  describe 'POST /create' do
    before do
      user.confirm
      sign_in user
      product
    end

    it 'request success' do
      post review_likes_path, params: { review_id: review.id }, xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'created like success' do
      expect do
        post review_likes_path, params: { review_id: review.id }, xhr: true
      end.to change(ReviewLike, :count).by 1
    end
  end

  describe 'DETELE /destroy' do
    before do
      user.confirm
      sign_in user
      product
      review_like
    end

    it 'returns http success' do
      delete review_like_path(review_like.id), xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'destroy like success' do
      expect do
        delete review_like_path(review_like.id), xhr: true
      end.to change(ReviewLike, :count).by(-1)
    end
  end
end
