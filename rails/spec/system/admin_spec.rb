require 'rails_helper'

RSpec.describe 'Admin', type: :system do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, bean: bean, user: user) }
  let(:bean_review_like) { create(:like, user: user, liked_id: bean_review.id, type: 'BeanReviewLike') }

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
      bean_review_like
      visit admin_bean_reviews_path
    end

    it 'displayed index' do
      expect(page).to have_content 'コーヒー豆レビュー'
    end

    it 'displayed show' do
      visit admin_bean_review_path(bean_review.id)
      expect(page).to have_content bean_review.title
      expect(page).to have_content user.username
    end

    it 'delete resource' do
      expect do
        visit admin_bean_review_path(bean_review.id)
        click_on 'コーヒー豆レビュー を削除する'
      end.to change(BeanReview, :count).by(-1)
    end
  end

  describe 'bean' do
    before do
      admin_login(admin)
      bean
      visit admin_beans_path
    end

    it 'displayed index' do
      expect(page).to have_content 'コーヒー豆'
    end

    it 'displayed show' do
      visit admin_bean_path(bean.id)
      expect(page).to have_content bean.name
    end

    it 'delete resource' do
      expect do
        visit admin_bean_path(bean.id)
        click_on 'コーヒー豆 を削除する'
      end.to change(Bean, :count).by(-1)
    end
  end
end
