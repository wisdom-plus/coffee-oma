require 'rails_helper'

RSpec.describe 'Admin bean_review_like' do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let!(:bean_review_like) { create(:bean_review_like, user: user, liked_id: bean_review.id) }

  describe 'bean_review_like' do
    before do
      admin_login(admin)
      visit admin_bean_review_likes_path
    end

    it 'displayed index' do
      expect(page).to have_content 'コーヒー豆レビューお気に入り'
    end

    it 'displayed show' do
      visit admin_bean_review_like_path(bean_review_like.id)
      expect(page).to have_content user.username
    end

    it 'delete resource' do
      expect do
        visit admin_bean_review_like_path(bean_review_like.id)
        click_on 'コーヒー豆レビューお気に入り を削除する'
      end.to change(BeanReviewLike, :count).by(-1)
    end
  end
end
