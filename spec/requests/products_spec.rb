require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:product_params) { attributes_for(:product) }
  let(:rakuten_product_params) { attributes_for(:product, imageurl: ENV['RAKUTEN_TEST_IMAGE_URL']) }

  describe 'GET /products' do
    it 'request success' do
      get products_path
      expect(response).to have_http_status(:ok)
    end

    it 'request success(tag_name)' do
      get products_path, params: { tag_name: 'コーヒー' }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /products/new' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success' do
      get new_product_path
      expect(response).to have_http_status(:ok)
    end

    it 'search rakuten' do
      get new_product_path, params: { keyword: 'コーヒー' }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /products' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success' do
      post products_path, params: { product: product_params }
      expect(response).to have_http_status(:found)
    end

    it 'created product' do
      expect do
        post products_path, params: { product: product_params }
      end.to change(Product, :count).by 1
    end
  end

  describe 'POST /products/rakuten_create' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success' do
      post rakuten_create_products_path, params: { product: rakuten_product_params }
      expect(response).to have_http_status(:found)
    end

    it 'created product' do
      expect do
        post rakuten_create_products_path, params: { product: rakuten_product_params }
      end.to change(Product, :count).by 1
    end
  end

  describe 'GET /products/:id' do
    it 'request success' do
      get product_path(product.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
