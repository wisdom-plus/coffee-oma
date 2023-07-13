require 'rails_helper'

RSpec.describe 'Component::Likes' do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }
  let(:product_like) { create(:product_like, user: user, liked_id: product.id) }
  let(:bean_like) { create(:bean_like, user: user, liked_id: bean.id) }

  describe 'GET home' do
    it 'request success' do
      product_like
      get home_component_likes_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET user_show' do
    it 'request success' do
      product_like
      bean_like
      get user_show_component_likes_path(user_id: user.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET product' do
    it 'request success' do
      product_like
      user.confirm
      sign_in user
      get product_component_likes_path(liked_id: product.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET bean' do
    it 'request success' do
      bean_like
      user.confirm
      sign_in user
      get bean_component_likes_path(liked_id: bean.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
