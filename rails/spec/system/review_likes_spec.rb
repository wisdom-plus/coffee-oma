require 'rails_helper'

RSpec.describe 'ReviewLikes', :js do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let!(:review) { create(:review, user: user, product: product) }
  let!(:bean) { create(:bean, user: user) }
  let!(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:product_review_like) { create(:product_review_like, user: user, liked_id: review.id) }
  let(:bean_review_like) { create(:bean_review_like, user: user, liked_id: bean_review.id) }

  context 'when login' do
    context 'create' do
      before do
        login(user, user.email, user.password)
      end

      context 'product_review_like' do
        it 'display button and click button' do
          visit product_path(product.id)
          turbo_lazy_loading('review_list')
          expect(page).to have_link nil, href: review_likes_path(review_id: review.id, type: review.class)

          click_link nil, href: review_likes_path(review_id: review.id, type: review.class)
          expect(page).to have_css '.destroy_button'
        end
      end

      context 'bean_review_like' do
        it 'display button and click button' do
          visit bean_path(bean.id)
          turbo_lazy_loading('bean_review_list')
          expect(page).to have_link nil, href: review_likes_path(review_id: bean_review.id, type: bean_review.class)

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
        it 'reder button and click button' do
          visit product_path(product.id)
          turbo_lazy_loading('review_list')
          expect(page).to have_link nil, href: review_like_path(product_review_like.id, type: product_review_like.type)

          click_link nil, href: review_like_path(product_review_like.id, type: product_review_like.type)
          expect(page).to have_css '.create_button'
        end
      end

      context 'bean_review_like' do
        it 'reder button' do
          visit bean_path(bean.id)
          turbo_lazy_loading('bean_review_list')
          expect(page).to have_link nil, href: review_like_path(bean_review_like.id, type: bean_review_like.type)

          click_link nil, href: review_like_path(bean_review_like.id, type: bean_review_like.type)
          expect(page).to have_css '.create_button'
        end
      end
    end
  end

  context 'when not signed' do
    it 'not render like button' do
      visit product_path(product.id)
      expect(page).not_to have_link nil, href: review_likes_path(review_id: review.id)
    end
  end
end
