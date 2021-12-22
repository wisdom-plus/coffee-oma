require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  let_it_be(:user) { create(:user) }
  let_it_be(:product) { create(:product,user: user) }
  let_it_be(:review) { create(:review, user: user, product: product) }
  let_it_be(:review_params) { attributes_for(:review, user_id: user.id, product_id: product.id) }

  describe 'POST create' do
    before do
      user.confirm
      sign_in user
      product
    end

    it 'request success' do
      post product_reviews_path(product.id), params: { review: review_params }
      expect(response).to have_http_status(:found)
    end

    it 'review created' do
      expect do
        post product_reviews_path(product.id), params: { review: review_params }
      end.to change(Review, :count).by 1
    end
  end
end
