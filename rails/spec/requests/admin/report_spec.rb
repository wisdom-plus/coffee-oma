require 'rails_helper'

RSpec.describe 'Admin' do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }
  let(:review) { create(:review, user: user, product: product) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }

  describe 'Report' do
    before do
      review
      bean_review
      sign_in admin
    end

    it 'created resource(review)' do
      expect do
        post admin_reports_path, params: { report: { user_id: user.id, review_id: review.id, review_type: review.class } }, xhr: true
      end.to change(Report, :count).by 1
    end

    it 'created resource(bean_review)' do
      expect do
        post admin_reports_path, params: { report: attributes_for(:report, user_id: user.id, review_id: bean_review.id, review_type: bean_review.class) }, xhr: true
      end.to change(Report, :count).by 1
    end
  end
end
