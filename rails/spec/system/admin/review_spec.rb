require 'rails_helper'

RSpec.describe 'Admin review', type: :system do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let!(:review) { create(:review, user: user, product: product) }

  describe 'review' do
    before do
      admin_login(admin)
      visit admin_reviews_path
    end

    it 'displayed index' do
      expect(page).to have_content '商品レビュー'
    end

    it 'displayed' do
      visit admin_review_path(review.id)
      expect(page).to have_content review.title
    end

    it 'delete resource' do
      expect do
        visit admin_review_path(review.id)
        click_on '商品レビュー を削除する'
      end.to change(Review, :count).by(-1)
    end
  end
end
