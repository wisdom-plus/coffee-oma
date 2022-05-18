require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let_it_be(:user) { create(:user) }
  let_it_be(:product) { create(:product,user: user) }


  describe 'Review' do
    before do
      user
      product
      sign_in admin
    end

    it 'created resource' do
      expect do
        post admin_reviews_path, params: { review: attributes_for(:review, user_id: user.id,product_id: product.id) }
      end.to change(Review, :count).by 1
    end
  end
end
