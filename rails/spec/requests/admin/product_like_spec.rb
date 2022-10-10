require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }

  describe 'BeanLike' do
    it 'created resource' do
      user
      product
      sign_in admin
      expect do
        post admin_product_likes_path, params: { product_like: attributes_for(:like, user_id: user.id, liked_id: product.id, type: 'ProductLike') }
      end.to change(Like, :count).by 1
    end
  end
end
