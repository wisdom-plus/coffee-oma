require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }

  let_it_be(:user) { create(:user) }

  describe 'Product' do
    before do
      user
      sign_in admin
    end

    it 'created resource' do
      expect do
        post admin_products_path, params: { product: attributes_for(:product, user_id: user.id) }
      end.to change(Product, :count).by 1
    end
  end
end
