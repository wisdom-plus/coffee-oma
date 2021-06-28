require 'rails_helper'

RSpec.describe 'Reports', type: :system, js: true do
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test2@example.com', username: 'test2') }
  let(:product) { create(:product) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:review) { create(:review, user: user, product: product) }
  let(:report) { create(:report, user: user1, review: review) }

  context 'when login' do
    before do
      login(user, user.email, user.password)
    end

    context 'review' do
      before do
        review
        visit product_path(product.id)
      end

      it 'display button' do
        expect(page).to have_link nil, href: reports_path(review_id: review.id, type: review.class)
      end

      it 'click report button' do
        page.accept_confirm do
          click_link nil, href: reports_path(review_id: review.id, type: review.class)
        end
        expect(page).to have_content '通報しました'
      end

      it 'review delete ' do
        expect do
          perform_enqueued_jobs do
            DeleteReviewJob.perform_later(review)
          end
        end.to change(Review, :count).by(-1)
      end
    end

    context 'bean_review' do
      before do
        bean_review
        visit bean_path(bean.id)
      end

      it 'display button' do
        expect(page).to have_link nil, href: reports_path(review_id: bean_review.id, type: bean_review.class)
      end

      it 'click report button' do
        page.accept_confirm do
          click_link nil, href: reports_path(review_id: bean_review.id, type: bean_review.class)
        end
        expect(page).to have_content '通報しました'
      end

      it 'review delete ' do
        expect do
          perform_enqueued_jobs do
            DeleteReviewJob.perform_later(bean_review)
          end
        end.to change(BeanReview, :count).by(-1)
      end
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
