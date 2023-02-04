require 'rails_helper'

RSpec.describe 'Admin' do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }

  describe 'Review' do
    it 'created resource' do
      user
      product
      sign_in admin
      expect do
        post admin_reviews_path, params: { review: attributes_for(:review, user_id: user.id, product_id: product.id) }
      end.to change(Review, :count).by 1
    end
  end
end
