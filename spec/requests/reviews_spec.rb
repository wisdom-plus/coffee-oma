require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  let(:product) { create(:product)}
  let(:user) { create(:user)}
  let(:review) { create(:review,user: user, product: product)}
  let(:review_params) { attributes_for(:review, user_id: user.id, product_id: product.id)}

  describe 'POST create' do
    before do
      user.confirm
      product
    end

    it 'request seccess' do
      post product_reviews_path(product.id), params: {review: review_params}
      expect(response).to have_http_status(:found)
    end

    it 'review created' do
      expect do
        post product_reviews_path(product.id), params: {review: review_params}
      end.to change(Review, :count).by 1
    end
  end

  describe 'GET index' do
    it 'request seccess' do
      get product_reviews_path(product.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
