require 'rails_helper'

RSpec.describe 'API::Likes' do
  let(:user) { create(:user) }
  let(:headers) { api_sign_in(user) }
  let(:product) { create(:product, user: user) }
  let(:product1) { create(:product, user: user, name: 'コーヒー器具の名前2') }
  let(:product_like) { create(:product_like, user: user, liked_id: product.id) }

  describe 'GET /api/v1/likes' do
    it 'レスポンス成功' do
      product
      product1
      get api_v1_likes_path
      expect(response).to have_http_status(:ok)
    end

    it 'レスポンスボディの検証' do
      product1
      product_like
      get api_v1_likes_path
      expect(json['likes']).to eq(expect_json(Product.all.order('likes_count desc').limit(9)))
    end

    it 'レスポンス失敗' do
      get api_v1_likes_path
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /api/v1/likes' do
    context 'ログインしている場合' do
      it 'レスポンス成功' do
        post api_v1_likes_path, params: { like: { liked_id: product.id } }, headers: headers
        expect(response).to have_http_status(:created)
      end

      it 'データが保存される' do
        expect do
          post api_v1_likes_path, params: { like: { liked_id: product.id } }, headers: headers
        end.to change(ProductLike, :count).by 1
      end

      it 'レスポンス失敗' do
        post api_v1_likes_path, params: { like: { liked_id: nil } }, headers: headers
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'ログインしていない場合' do
      it 'レスポンス失敗' do
        post api_v1_likes_path, params: { like: { liked_id: product.id } }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /api/v1/likes/:id' do
    context 'ログインしている場合' do
      it 'レスポンス成功' do
        delete api_v1_like_path(product_like.id), headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'データが削除される' do
        product_like
        expect do
          delete api_v1_like_path(product_like.id), headers: headers
        end.to change(ProductLike, :count).by(-1)
      end

      it 'レスポンス失敗' do
        delete api_v1_like_path(0), headers: headers
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'ログインしていない場合' do
      it 'レスポンス失敗' do
        delete api_v1_like_path(product_like.id)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /api/v1/likes/exists' do
    context 'ログインしている場合' do
      it 'レスポンス成功' do
        get exists_api_v1_likes_path, params: { liked_id: product.id }, headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'レスポンスボディの検証' do
        product_like
        get exists_api_v1_likes_path, params: { liked_id: product.id }, headers: headers
        expect(json['liked']).to eq(expect_json(true))
        expect(json['count']).to eq(expect_json(product.product_likes.size))
      end

      it 'レスポンス失敗' do
        get exists_api_v1_likes_path, params: { liked_id: nil }, headers: headers
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'ログインしていない場合' do
      it 'レスポンス成功' do
        get exists_api_v1_likes_path, params: { liked_id: product.id }
        expect(response).to have_http_status(:ok)
      end

      it 'レスポンスボディの検証' do
        product_like
        get exists_api_v1_likes_path, params: { liked_id: product.id }
        expect(json['liked']).to eq(expect_json(false))
        expect(json['count']).to eq(expect_json(product.product_likes.size))
      end

      it 'レスポンス失敗' do
        get exists_api_v1_likes_path, params: { liked_id: nil }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
