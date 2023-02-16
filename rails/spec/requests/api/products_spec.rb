require 'rails_helper'

RSpec.describe 'API::Products' do
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

      it 'データが保存される' do
        expect do
          post api_v1_products_path, params: { product: product_params }, headers: headers
        end.to change(Product, :count).by 1
      end

      it 'レスポンス失敗(name)' do
        post api_v1_products_path, params: { product: attributes_for(:product, name: '') }, headers: headers
        expect(response).to have_http_status(:bad_request)
      end

      it 'レスポンス失敗(priceが空)' do
        post api_v1_products_path, params: { product: attributes_for(:product, price: '') }, headers: headers
        expect(response).to have_http_status(:bad_request)
      end

      it 'レスポンス失敗(caption)' do
        post api_v1_products_path, params: { product: attributes_for(:product, caption: '') }, headers: headers
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'ログインしていない場合' do
      it 'レスポンス失敗' do
        post api_v1_products_path, params: { product: product_params }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
