require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, product: product, user: user) }


  describe 'BeanLike' do
    before do
      user
      review
      sign_in admin
    end

    it 'created resource' do
      expect do
        post admin_product_review_likes_path, params: { product_review_like: attributes_for(:like, user_id: user.id,liked_id: review.id,type: 'ProductReviewLike') }
      end.to change(Like, :count).by 1
    end
  end
end
