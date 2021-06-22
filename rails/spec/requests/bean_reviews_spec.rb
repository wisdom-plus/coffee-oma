require 'rails_helper'

RSpec.describe 'BeanReviews', type: :request do
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:recipe) { create(:recipe, bean_review: bean_review) }
  let(:bean_review_params) { attributes_for(:bean_review, amount: '', grinding: '', powdergram: '', temperature: '', time1: '', time2: '') }

  describe 'POST create' do
    before do
      user.confirm
      sign_in user
      bean
    end

    it 'request success' do
      post bean_bean_reviews_path(bean.id), params: { bean_review: bean_review_params }
      expect(response).to have_http_status(:found)
    end

    it 'review created ' do
      expect do
        post bean_bean_reviews_path(bean.id), params: { bean_review: bean_review_params }
      end.to change(BeanReview, :count).by 1
    end
  end
end
