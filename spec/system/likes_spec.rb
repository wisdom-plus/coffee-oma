require 'rails_helper'

RSpec.describe 'Likes', type: :system do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:like) { create(:like, user: user, product: product) }

  describe 'create' do
    context 'signed' do
      before do
        login(user, user.email, user.password)
        visit product_path(product.id)
      end

      it 'render button' do
        expect(page).to have_link 'お気に入り登録'
      end

      it 'click like button' do
        click_on 'お気に入り登録'
        expect(page).to have_link 'お気に入り登録中'
      end
    end

    context 'not signed' do
      before do
        visit product_path(product.id)
      end

      it 'not render like button' do
        expect(page).to have_no_link 'お気に入り登録'
      end
    end
  end

  describe 'destroy' do
    context 'signed' do
      before do
        login(user, user.email, user.password)
        like
        visit product_path(product.id)
      end

      it 'reder button' do
        expect(page).to have_link 'お気に入り登録中'
      end

      it 'click button' do
        click_on 'お気に入り登録中'
        visit product_path(product.id)
        expect(page).to have_link 'お気に入り登録'
      end
    end

    context 'not signed' do
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
