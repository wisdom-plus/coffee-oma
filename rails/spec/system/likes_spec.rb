require 'rails_helper'

RSpec.describe 'Likes', type: :system do
  let(:user) { create(:user) }
  let(:user1) { create(:user, username: 'test1', email: 'test1@example.com') }
  let(:product) { create(:product) }
  let(:product1) { create(:product, itemname: 'コーヒー豆の種類', likes_count: 2) }
  let(:like) { create(:like, user: user, product: product) }

  describe 'index' do
    before do
      user1
      like
      product1
      visit likes_path
    end

    it 'render product' do
      expect(page).to have_link nil, href: product_path(product.id)
    end

    it 'render ranking' do
      ranking = first('div.ui.three.stackable.cards.segment.mt-3rem a')
      ranking.click
      expect(page).to have_current_path product_path(product1.id), ignore_query: true
    end
  end

  describe 'create' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
        visit product_path(product.id)
      end

      it 'click like button' do
        click_on 'お気に入り登録'
        expect(page).to have_link 'お気に入り登録中'
      end
    end

    context 'when not login' do
      before do
        visit product_path(product.id)
      end

      it 'not render like button' do
        expect(page).to have_no_link 'お気に入り登録'
      end
    end
  end

  describe 'destroy' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
        like
        visit product_path(product.id)
      end

      it 'click like destroy button' do
        click_on 'お気に入り登録中'
        expect(page).to have_link 'お気に入り登録'
      end
    end

    context 'when not login' do
      before do
        like
        visit product_path(product.id)
      end

      it 'not render button' do
        expect(page).to have_no_link 'お気に入り登録中'
      end
    end
  end
end
