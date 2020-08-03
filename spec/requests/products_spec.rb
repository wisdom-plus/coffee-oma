require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:product) { create(:product) }
  let(:product_params) { attributes_for(:product) }

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
  end

  describe 'POST /products' do
    it 'request seccees' do
      post products_path, params: { product: product_params }
      expect(response).to have_http_status(:found)
    end

    it 'prodcut created' do
      expect do
        post products_path, params: { product: product_params }
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
