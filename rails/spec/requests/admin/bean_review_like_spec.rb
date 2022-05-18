require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, bean: bean, user: user) }

  describe 'BeanReviewLike' do
    before do
      user
      bean_review
      sign_in admin
    end

    it 'created resource' do
      expect do
        post admin_bean_review_likes_path, params: { bean_review_like: attributes_for(:like, user_id: user.id, liked_id: bean_review.id, type: 'BeanReviewLike') }
      end.to change(Like, :count).by 1
    end
  end
end
