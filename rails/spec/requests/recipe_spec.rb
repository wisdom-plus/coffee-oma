require 'rails_helper'

RSpec.describe 'Recipe' do
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:recipe) { create(:recipe, bean_review: bean_review) }
  let(:bean_review_params) { attributes_for(:bean_review, amount: '220', grinding: '中細挽き', powdergram: '22', temperature: '95', time1: '2', time2: '30') }

  describe 'POST create' do
    before do
      user.confirm
      sign_in user
      bean
    end

    it 'request success' do
      post bean_bean_reviews_path(bean.id), params: { bean_review: bean_review_params }
      expect(response).to have_http_status(:see_other)
    end

    it 'review created' do
      expect do
        post bean_bean_reviews_path(bean.id), params: { bean_review: bean_review_params }
      end.to change(Recipe, :count).by 1
    end
  end
end
