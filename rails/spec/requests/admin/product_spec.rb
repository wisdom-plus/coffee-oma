require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }

  describe 'Product' do
    it 'created resource' do
      user
      sign_in admin
      expect do
        post admin_products_path, params: { product: attributes_for(:product, user_id: user.id) }
      end.to change(Product, :count).by 1
    end
  end
end
