require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:like) { create(:like, user: user, product: product) }

  describe 'POST create' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success' do
      post likes_path, params: { product_id: product.id }, xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'created like success' do
      expect do
        post likes_path, params: { product_id: product.id }, xhr: true
      end.to change(Like, :count).by 1
    end
  end

  describe 'DELETE destroy' do
    before do
      user.confirm
      sign_in user
      like
    end

    it 'request success' do
      delete like_path(like.id), xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'destroy like success' do
      expect do
        delete like_path(like.id), xhr: true
      end.to change(Like, :count).by(-1)
    end
  end
end
