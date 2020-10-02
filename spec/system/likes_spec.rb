require 'rails_helper'

RSpec.describe 'Likes', type: :system do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:like) { create(:like, user: user, product: product) }

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
