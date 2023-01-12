require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user, product: product) }
  let(:review_params) { attributes_for(:review, user_id: user.id, product_id: product.id) }

  describe 'POST create' do
    before do
      user.confirm
      sign_in user
      product
    end

    it 'request success' do
      post product_reviews_path(product.id), params: { review: review_params }
      expect(response).to have_http_status(:see_other)
    end

    it 'review created' do
      expect do
        post product_reviews_path(product.id), params: { review: review_params }
      end.to change(Review, :count).by 1
    end
  end
end
