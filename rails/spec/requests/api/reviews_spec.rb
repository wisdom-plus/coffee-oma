require 'rails_helper'

RSpec.describe 'API::Reviews' do
  let(:user) { create(:user) }
  let(:other_user) { create(:user, :other_user) }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user, product: product) }
  let(:review1) { create(:review, user: other_user, product: product) }
  let(:review_params) { attributes_for(:review, product_id: product.id) }
  let(:headers) { api_sign_in(user) }

  describe 'POST /api/v1/products/:id/reviews' do
    context 'ログインしている場合' do
      it 'レスポンス成功' do
        post api_v1_product_reviews_path(product.id), params: { review: review_params }, headers: headers
        expect(response).to have_http_status(:created)
      end

      it 'データが保存される' do
        expect do
          post api_v1_product_reviews_path(product.id), params: { review: review_params }, headers: headers
        end.to change(Review, :count).by 1
      end

      it 'レスポンス失敗' do
        post api_v1_product_reviews_path(0), params: { review: review_params }, headers: headers
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'ログインしていない場合' do
      it 'レスポンス失敗' do
        post api_v1_product_reviews_path(product.id), params: { review: review_params }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /api/v1/products/:id/reviews/:id' do
    context 'ログインしている場合' do
      it 'レスポンス成功' do
        delete api_v1_product_review_path(product.id, review.id), headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'データが削除される' do
        review
        expect do
          delete api_v1_product_review_path(product.id, review.id), headers: headers
        end.to change(Review, :count).by(-1)
      end

      it 'レスポンス失敗' do
        delete api_v1_product_review_path(0, 0), headers: headers
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'ログインしていない場合' do
      it 'レスポンス失敗' do
        delete api_v1_product_review_path(product.id, review.id)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /api/v1/products/:id/reviews/exists' do
    context 'ログインしている場合' do
      it 'レスポンス成功' do
        review
        review1
        get exists_api_v1_product_reviews_path(product.id), headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'レスポンスボディの検証' do
        review
        review1
        get exists_api_v1_product_reviews_path(product.id), headers: headers
        expect(json['reviews']).to eq(expect_json(Review.api_json(product.id)))
      end

      it 'レスポンス失敗' do
        get exists_api_v1_product_reviews_path(0), headers: headers
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'ログインしていない場合' do
      it 'レスポンス成功' do
        review
        review1
        get exists_api_v1_product_reviews_path(product.id)
        expect(response).to have_http_status(:ok)
      end

      it 'レスポンス失敗' do
        get exists_api_v1_product_reviews_path(product.id)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
