require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:product_params) { attributes_for(:product, image: nil) }
  let(:headers) { api_sign_in(user) }

  describe 'GET /api/v1/products' do
    it 'レスポンス成功' do
      product
      get api_v1_products_path
      expect(response).to have_http_status(:ok)
    end

    it 'レスポンスボディの検証' do
      product
      get api_v1_products_path
      expect(json['product']['data']).to eq(expect_json(Product.index_pagenation(0)))
      expect(json['product']['pages']).to eq(expect_json(0))
      expect(json['product']['nextpage']).to eq(expect_json(false))
    end

    it 'レスポンス失敗' do
      get api_v1_products_path
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET /api/v1/products/:id' do
    it 'レスポンス成功' do
      get api_v1_product_path(product.id)
      expect(response).to have_http_status(:ok)
    end

    it 'レスポンスボディの検証' do
      get api_v1_product_path(product.id)
      expect(json['product']).to eq(expect_json(product.api_json))
    end

    it 'レスポンス失敗' do
      get api_v1_product_path(0)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /api/v1/products' do
    context 'ログインしている場合' do
      it 'レスポンス成功' do
        post api_v1_products_path, params: { product: product_params }, headers: headers
        expect(response).to have_http_status(:created)
      end
    end
  end
end
