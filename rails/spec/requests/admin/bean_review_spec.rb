require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }

  describe 'BeanReview' do

    it 'created resource' do
      user
      bean
      sign_in admin
      expect do
        post admin_bean_reviews_path, params: { bean_review: attributes_for(:bean_review, bean_id: bean.id, user_id: user.id) }
      end.to change(BeanReview, :count).by 1
    end
  end
end
