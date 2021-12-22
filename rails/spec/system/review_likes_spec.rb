require 'rails_helper'

RSpec.describe 'ReviewLikes', type: :system, js: true do
  let(:user) { create(:user) }
  let(:product) { create(:product,user: user) }
  let(:review) { create(:review, user: user, product: product) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:product_review_like) { create(:like, user: user, liked_id: review.id, type: 'ProductReviewLike') }
  let(:bean_review_like) { create(:like, user: user, liked_id: bean_review.id, type: 'BeanReviewLike') }

  context 'when login' do
    context 'create' do
      before do
        login(user, user.email, user.password)
        review
        bean_review
      end

      context 'product_review_like' do
        before do
          visit product_path(product.id)
        end

        it 'display button' do
          expect(page).to have_link nil, href: review_likes_path(review_id: review.id, type: review.class)
        end

        it 'click like button' do
          click_link nil, href: review_likes_path(review_id: review.id, type: review.class)
          expect(page).to have_css '.destroy_button'
        end
      end

      context 'bean_review_like' do
        before do
          visit bean_path(bean.id)
        end

        it 'display button' do
          expect(page).to have_link nil, href: review_likes_path(review_id: bean_review.id, type: bean_review.class)
        end

        it 'click like button' do
          click_link nil, href: review_likes_path(review_id: bean_review.id, type: bean_review.class)
          expect(page).to have_css '.destroy_button'
        end
      end
    end

    context 'destroy' do
      before do
        login(user, user.email, user.password)
        product_review_like
        bean_review_like
      end

      context 'product_review_like' do
        before do
          visit product_path(product.id)
        end

        it 'reder button' do
          expect(page).to have_link nil, href: review_like_path(product_review_like.id, type: product_review_like.type)
        end

        it 'click button' do
          click_link nil, href: review_like_path(product_review_like.id, type: product_review_like.type)
          expect(page).to have_css '.create_button'
        end
      end

      context 'bean_review_like' do
        before do
          visit bean_path(bean.id)
        end

        it 'reder button' do
          expect(page).to have_link nil, href: review_like_path(bean_review_like.id, type: bean_review_like.type)
        end

        it 'click button' do
          click_link nil, href: review_like_path(bean_review_like.id, type: bean_review_like.type)
          expect(page).to have_css '.create_button'
        end
      end
    end
  end

  context 'when not signed' do
    before do
      review
      visit product_path(product.id)
    end

    it 'not render like button' do
      expect(page).to have_no_link nil, href: review_likes_path(review_id: review.id)
    end
  end
end
