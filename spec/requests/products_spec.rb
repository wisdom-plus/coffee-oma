require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:product) { create(:product) }
  let(:product_params) { attributes_for(:product) }
  let(:rakuten_product_params) { attributes_for(:product, imageurl: ENV['RAKUTEN_TEST_IMAGE_URL']) }

  describe 'GET /products' do
    it 'request seccees' do
      get products_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /products/new' do
    it 'request seccees' do
      get new_product_path
      expect(response).to have_http_status(:ok)
    end

    it 'search rakuten' do
      get new_product_path, params: { keyword: 'コーヒー' }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /products' do
    it 'request seccees' do
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
    it 'request seccees' do
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
    it 'request seccees' do
      get product_path(product.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
