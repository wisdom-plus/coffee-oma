require 'rails_helper'

RSpec.describe 'Reports', type: :system, js: true do
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test2@example.com', username: 'test2') }
  let(:product) { create(:product) }
  let(:review) { create(:review, user: user, product: product) }
  let(:report) { create(:report, user: user1, review: review) }

  context 'when login' do
    before do
      login(user, user.email, user.password)
      review
      visit product_path(product.id)
    end

    it 'display button' do
      expect(page).to have_link nil, href: reports_path(review_id: review.id)
    end

    it 'click report button' do
      page.accept_confirm do
        click_link nil, href: reports_path(review_id: review.id)
      end
      expect(page).to have_content '通報しました'
    end

    it 'review delete ' do
      expect do
        create_list(:report, 10, user_id: user1.id, review_id: review.id)
        page.accept_confirm do
          click_link nil, href: reports_path(review_id: review.id)
        end
        visit root_path
      end.to change(Review, :count).by(-1)
    end
  end

  context 'when not login' do
    before do
      review
      visit product_path(product.id)
    end

    it 'not display report button' do
      expect(page).to have_no_link nil, href: reports_path(review_id: review.id)
    end
  end
end