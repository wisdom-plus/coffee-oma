require 'rails_helper'

RSpec.describe 'Reports', type: :system, js: true do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:review) { create(:review, user: user, product: product) }
  let(:review1) { create(:review, user: user1, product: product) }
  let(:report) { create(:report, user: user1, review: review) }

  context 'when login' do
    before do
      login(user, user.email, user.password)
    end

    context 'review' do
      before do
        review
        review1
        visit product_path(product.id)
      end

      it 'display button and click button' do
        first('.report-modal-button').click
        expect(page).to have_link 'レビューを通報する', href: reports_path(review_id: review.id, type: review.class)

        click_link 'レビューを通報する', href: reports_path(review_id: review.id, type: review.class)
        expect(page).to have_content 'レビューを通報しました。'
      end
    end

    context 'bean_review' do
      before do
        bean_review
        visit bean_path(bean.id)
      end

      it 'display button and click button' do
        first('.report-modal-button').click
        expect(page).to have_link 'レビューを通報する', href: reports_path(review_id: bean_review.id, type: bean_review.class)

        click_link nil, href: reports_path(review_id: bean_review.id, type: bean_review.class)
        expect(page).to have_content 'レビューを通報しました。'
      end
    end
  end

  context 'when not login' do
    it 'not display report button' do
      review
      visit product_path(product.id)
      expect(page).to have_no_link nil, href: reports_path(review_id: review.id)
    end
  end
end
