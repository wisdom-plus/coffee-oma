require 'rails_helper'

RSpec.describe 'Reports', type: :request do
  let_it_be(:user) { create(:user) }
  let_it_be(:product) { create(:product, user: user) }
  let_it_be(:bean) { create(:bean, user: user) }
  let_it_be(:review) { create(:review, user: user, product: product) }
  let_it_be(:bean_review) { create(:bean_review, user: user, bean: bean) }

  describe 'GET /create' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success(review)' do
      post reports_path, params: { review_id: review.id, type: review.class }, xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'request success(bean_review)' do
      post reports_path, params: { review_id: bean_review.id, type: bean_review.class }, xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'created report success(reivew)' do
      expect do
        post reports_path, params: { review_id: review.id, type: review.class }, xhr: true
      end.to change(Report, :count).by 1
    end

    it 'created report success(bean_reivew)' do
      expect do
        post reports_path, params: { review_id: bean_review.id, type: bean_review.class }, xhr: true
      end.to change(Report, :count).by 1
    end
  end
end
