require 'rails_helper'

RSpec.describe 'Likes' do
  let_it_be(:user) { create(:user) }
  let_it_be(:product) { create(:product, user: user) }
  let_it_be(:bean) { create(:bean, user: user) }
  let(:product_like) { create(:product_like, user: user, liked_id: product.id) }
  let(:bean_like) { create(:bean_like, user: user, liked_id: bean.id) }
  let(:product_like_class) { 'ProductLike' }
  let(:bean_like_class) { 'BeanLike' }

  describe 'POST create' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success' do
      post likes_path, params: { liked_id: product.id, type: product_like_class }, xhr: true
      expect(response).to have_http_status(:see_other)
    end

    it 'created product_like success' do
      expect do
        post likes_path, params: { liked_id: product.id, type: product_like_class }, xhr: true
      end.to change(Like, :count).by 1
    end

    it 'count up product likes_count' do
      post likes_path, params: { liked_id: product.id, type: product_like_class }, xhr: true
      expect(Product.find(product.id).likes_count).to eq 1
    end

    it 'created bean_like success' do
      expect do
        post likes_path, params: { liked_id: bean.id, type: bean_like_class }, xhr: true
      end.to change(Like, :count).by 1
    end

    it 'count up bean likes_count' do
      post likes_path, params: { liked_id: bean.id, type: bean_like_class }, xhr: true
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
      delete like_path(product_like.id, type: product_like_class), xhr: true
      expect(response).to have_http_status(:see_other)
    end

    it 'destroy product_like success' do
      expect do
        delete like_path(product_like.id, type: product_like_class), xhr: true
      end.to change(Like, :count).by(-1)
    end

    it 'destroy bean_like success' do
      expect do
        delete like_path(bean_like.id, type: bean_like_class), xhr: true
      end.to change(Like, :count).by(-1)
    end
  end

  describe 'GET index' do
    it 'request success' do
      user.confirm
      sign_in user
      product_like
      get likes_path
      expect(response).to have_http_status(:ok)
    end
  end
end
