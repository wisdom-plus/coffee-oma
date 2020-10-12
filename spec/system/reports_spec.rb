require 'rails_helper'

RSpec.describe "Reports", type: :system, js: true do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:review) { create(:review, user: user, product: product) }

  context "when login" do
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
      expect(page).to have_content "通報しました"
    end

  end

  context "when not login" do
    before do
      review
      visit product_path(product.id)
    end

    it "not display report button" do
      expect(page).to have_no_link nil, href: reports_path(review_id: review.id)
    end
  end
end
