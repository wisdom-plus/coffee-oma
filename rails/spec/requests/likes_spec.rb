require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  let_it_be(:user) { create(:user) }
  let_it_be(:product) { create(:product, user: user) }
  let_it_be(:bean) { create(:bean, user: user) }
  let(:product_like) { create(:like, user: user, liked_id: product.id, type: 'ProductLike') }
  let(:bean_like) { create(:like, user: user, liked_id: bean.id, type: 'BeanLike') }

  describe 'POST create' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success' do
      post likes_path, params: { liked_id: product.id, type: 'Product' }, xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'created product_like success' do
      expect do
        post likes_path, params: { liked_id: product.id, type: 'Product' }, xhr: true
      end.to change(Like, :count).by 1
    end

    it 'count up product likes_count' do
      post likes_path, params: { liked_id: product.id, type: 'Product' }, xhr: true
      expect(Product.find(product.id).likes_count).to eq 1
    end

    it 'created bean_like success' do
      expect do
        post likes_path, params: { liked_id: bean.id, type: 'Bean' }, xhr: true
      end.to change(Like, :count).by 1
    end

    it 'count up bean likes_count' do
      post likes_path, params: { liked_id: bean.id, type: 'Bean' }, xhr: true
      expect(Bean.find(bean.id).likes_count).to eq 1
    end
  end

  describe 'DELETE destroy' do
    before do
      user.confirm
      sign_in user
      product_like
      bean_like
    end

    it 'request success' do
      delete like_path(product_like.id, type: 'ProductLike'), xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'destroy product_like success' do
      expect do
        delete like_path(product_like.id, type: 'ProductLike'), xhr: true
      end.to change(Like, :count).by(-1)
    end

    it 'destroy bean_like success' do
      expect do
        delete like_path(bean_like.id, type: 'BeanLike'), xhr: true
      end.to change(Like, :count).by(-1)
    end
  end

  describe 'GET index' do
    before do
      user.confirm
      sign_in user
      product_like
    end

    it 'request success' do
      get likes_path
      expect(response).to have_http_status(:ok)
    end
  end
end
