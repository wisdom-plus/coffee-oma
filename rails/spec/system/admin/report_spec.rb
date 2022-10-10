require 'rails_helper'

RSpec.describe 'Admin report', type: :system do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:review) { create(:review, user: user, product: product) }
  let(:review1) { create(:review, user: user1, product: product) }
  let!(:review_report) { create(:report, user: user1, review: review) }
  let!(:bean_review_report) { create(:report, user: user1, review: bean_review) }

  describe 'report' do
    before do
      admin_login(admin)
      visit admin_reports_path
    end

    it 'displayed index' do
      expect(page).to have_content '通報'
    end

    it 'created admin' do
      expect do
        visit new_admin_report_path
        fill_in 'report_review_id', with: review.id
        fill_in 'report_user_id', with: user.id
        fill_in 'report_review_type', with: review.class
        click_on '通報を作成'
      end.to change(Report, :count).by(1)
    end

    it 'displayed show(review)' do
      visit admin_report_path(review_report.id)
      expect(page).to have_content user1.username
      expect(page).to have_content review_report.review.product.name
    end

    it 'displayed show(bean_review)' do
      visit admin_report_path(bean_review_report.id)
      expect(page).to have_content user1.username
      expect(page).to have_content bean_review_report.review.bean.name
    end

    it 'delete resource' do
      expect do
        visit admin_report_path(review_report.id)
        click_on '通報 を削除する'
      end.to change(Report, :count).by(-1)
    end
  end
end
