require 'rails_helper'

RSpec.describe 'Likes', :js do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:product) { create(:product, user: user) }
  let(:product1) { create(:product, name: 'コーヒー豆の種類', likes_count: 2, user: user) }
  let(:bean) { create(:bean, user: user) }
  let(:product_like) { create(:like, user: user, liked_id: product.id, type: 'ProductLike') }
  let(:bean_like) { create(:like, user: user, liked_id: bean.id, type: 'BeanLike') }

  describe 'index' do
    it 'render product' do
      product
      product1
      visit likes_path
      expect(page).to have_link nil, href: product_path(product.id)
      expect(page).to have_link nil, href: product_path(product1.id)
      first('div.ui.three.stackable.cards.segment.mt-3rem a').click
      expect(page).to have_current_path product_path(product1.id)
    end
  end

  describe 'create' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
      end

      it 'click like button(product)' do
        visit product_path(product.id)
        click_link nil, href: likes_path(liked_id: product.id, type: product.class)
        expect(page).to have_css '#like_destory'
        expect(find('.likes_count')).to have_text '1'
      end

      it 'click like button(bean)' do
        visit bean_path(bean.id)
        click_link nil, href: likes_path(liked_id: bean.id, type: bean.class)
        expect(page).to have_css '#like_destory'
        expect(find('.likes_count')).to have_text '1'
      end
    end

    context 'when not login' do
      it 'not render like button' do
        visit product_path(product.id)
        expect(page).not_to have_css '#like_destory'
      end
    end
  end

  describe 'destroy' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
        product_like
        bean_like
      end

      it 'click like destroy button(product)' do
        visit product_path(product.id)
        click_link nil, href: like_path(product_like.id, type: product.class)
        expect(page).to have_css '#like_create'
      end

      it 'click like destroy button(bean)' do
        visit bean_path(bean.id)
        click_link nil, href: like_path(bean_like.id, type: bean.class)
        expect(page).to have_css '#like_create'
      end
    end

    context 'when not login' do
      it 'not render button' do
        product_like
        visit product_path(product.id)
        expect(page).not_to have_css '#like_create'
      end
    end
  end
end
