require 'rails_helper'

RSpec.describe 'Component::Reviews' do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user, product: product) }

  describe 'GET home' do
    it 'request success' do
      review
      get home_component_reviews_path
      expect(response).to have_http_status(:ok)
    end

    it 'request failure' do
      get home_component_reviews_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET list' do
    it 'request success when user not signed in' do
      review
      get list_component_reviews_path(product_id: product.id)
      expect(response).to have_http_status(:ok)
    end

    it 'request success when user signed in' do
      user.confirm
      sign_in user
      review
      get list_component_reviews_path(product_id: product.id)
      expect(response).to have_http_status(:ok)
    end

    it 'request failure' do
      get list_component_reviews_path(product_id: product.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET user_show' do
    it 'request success' do
      review
      get user_show_component_reviews_path(user_id: user.id)
      expect(response).to have_http_status(:ok)
    end

    it 'request failure' do
      get user_show_component_reviews_path(user_id: user.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
