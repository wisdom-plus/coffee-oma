require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:product_params) { attributes_for(:product) }

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
      let(:auth_helpers_auth_token) {
        public_send(:user).create_new_auth_token
      }

      it 'レスポンス成功' do
        binding.pry

        post api_v1_products_path, params: { product: product_params }
        expect(response).to have_http_status(:created)
      end
    end
  end
end
