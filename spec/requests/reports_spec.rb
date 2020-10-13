require 'rails_helper'

RSpec.describe 'Reports', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:review) { create(:review, user: user, product: product) }

  describe 'GET /create' do
    before do
      user.confirm
      sign_in user
      review
    end

    it 'request success' do
      post reports_path, params: { review_id: review.id }, xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'created report success' do
      expect do
        post reports_path, params: { review_id: review.id }, xhr: true
      end.to change(Report, :count).by 1
    end
  end
end
