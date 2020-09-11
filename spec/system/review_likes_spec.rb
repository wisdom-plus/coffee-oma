require 'rails_helper'

RSpec.describe 'ReviewLikes', type: :system do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:review) { create(:review, user: user, product: product) }
  let(:review_like) { create(:review_like, user: user, review: review) }

  describe 'create' do
    context 'signed' do
      before do
        login(user, user.email, user.password)
        review
        visit product_path(product.id)
      end

      it 'display button' do
        expect(page).to have_link nil, href: review_likes_path(review_id: review.id)
      end

      it 'click like button' do
        click_link nil, href: review_likes_path(review_id: review.id)
        visit product_path(product.id)
        expect(page).to have_css '.destroy_button'
      end
    end

    context 'not signed' do
      before do
        user
        review
        visit product_path(product.id)
      end

      it 'not render like button' do
        expect(page).to have_no_link nil, href: review_likes_path(review_id: review.id)
      end
    end
  end

  describe 'destroy' do
    context 'signed' do
      before do
        login(user, user.email, user.password)
        review
        review_like
        visit product_path(product.id)
      end

      it 'reder button' do
        expect(page).to have_link nil, href: review_like_path(review_like.id)
      end

      it 'click button' do
        click_link nil, href: review_like_path(review_like.id)
        visit product_path(product.id)
        expect(page).to have_css '.create_button'
      end
    end

    context 'not signed' do
      before do
        review
        review_like
        visit product_path(product.id)
      end

      it 'not render button' do
        expect(page).to have_no_link nil, href: review_like_path(review_like.id)
      end
    end
  end
end
