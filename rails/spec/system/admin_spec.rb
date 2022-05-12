require 'rails_helper'

Rspec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:bean_review) { create(:bean_review, user: user) }

  describe 'dashborad' do
    before do
      admin_login(admin)
      visit admin_root_path
    end

    it 'display dashborad' do
      expect(page).to have_content 'ダッシュボード'
      expect(page).to have_current_path admin_root_path
    end
  end

  describe 'bean_review' do
    before do
      admin_login(admin)
      bean_review
      visit admin_bean_reviews_path
    end

    it 'displayed index' do
      expect(page).to have_content 'コーヒー豆レビュー'
    end

    it 'displayed show' do
      visit admin_bean_review_path(bean_review.id)
      expect(page).to have_content bean_review.title
    end
  end
end
