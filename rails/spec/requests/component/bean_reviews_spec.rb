require 'rails_helper'

RSpec.describe 'Component::BeanReviews' do
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }

  describe 'GET list' do
    context 'when user signed in' do
      it 'request success' do
        user.confirm
        sign_in user
        bean_review
        get list_component_bean_reviews_path(bean_id: bean.id)
        expect(response).to have_http_status(:ok)
      end

      it 'request success(not bean_review)' do
        user.confirm
        sign_in user
        get list_component_bean_reviews_path(bean_id: bean.id)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when user not signed in' do
      it 'request success when user not signed in' do
        bean_review
        get list_component_bean_reviews_path(bean_id: bean.id)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
