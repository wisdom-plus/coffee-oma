require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }

  let_it_be(:user) { create(:user) }
  let_it_be(:bean) { create(:bean, user: user) }
  let_it_be(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let_it_be(:recipe) { create(:recipe, bean_review: bean_review) }

  describe 'BeanReview' do
    before do
      user
      bean
      sign_in admin
    end

    it 'created resource' do
      expect do
        post admin_bean_reviews_path, params: { bean_review: attributes_for(:bean_review, bean_id: bean.id, user_id: user.id) }
      end.to change(BeanReview, :count).by 1
    end
  end
end
