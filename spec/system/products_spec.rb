require 'rails_helper'

RSpec.describe 'Products', type: :system do
  let(:product) { create(:product) }

  describe 'product' do
    describe 'new' do
      before do
        visit new_product_path
      end

      it 'render page' do
        expect(page).to have_current_path new_product_path
      end

      it 'search rakuten' do
        fill_in 'keyword', with: 'コーヒー'
        click_on 'search'
        expect(page).to have_button '登録する'
      end

      it 'create rakuten_product' do
        fill_in 'keyword', with: 'コーヒー'
        click_on 'search'
        within first('div.ui.fluid.card') do
          click_button '登録する'
        end
        expect(page).to have_content 'アイテムの一覧'
      end

      it 'redirect index(rakuten_product)' do
        fill_in 'keyword', with: 'コーヒー'
        click_on 'search'
        within first('div.ui.fluid.card') do
          click_button '登録する'
        end
        expect(page).to have_current_path products_path
      end

      it 'create manual_product' do
        fill_in 'item-name', with: 'コーヒーの器具の名前'
        fill_in 'shop-name', with: 'コーヒーのメーカー'
        fill_in 'catchcopy', with: 'キャッチコピー'
        fill_in 'itemprice', with: '1000'
        fill_in 'itemcaption', with: 'アイテムの説明文が入ります'
        click_on 'submit'
        expect(page).to have_content 'コーヒーの器具の名前'
      end

      it 'redirect index(manual_product)' do
        fill_in 'item-name', with: 'コーヒーの器具の名前'
        fill_in 'shop-name', with: 'コーヒーのメーカー'
        fill_in 'catchcopy', with: 'キャッチコピー'
        fill_in 'itemprice', with: '1000'
        fill_in 'itemcaption', with: 'アイテムの説明文が入ります'
        click_on 'submit'
        expect(page).to have_current_path products_path
      end
    end

    describe 'index' do
      before do
        product
        visit products_path
      end

      it 'render page' do
        expect(page).to have_current_path products_path
      end

      it 'product displayed' do
        link = find('.ui.fluid.link.card')
        expect(link[:href]).to eq product_path(product.id)
      end

      it 'redirect show' do
        click_link nil, href: product_path(product.id)
        expect(page).to have_current_path product_path(product.id)
      end
    end

    describe 'show' do
      before do
        product
      end

      it 'render page' do
        visit product_path(product.id)
        expect(page).to have_current_path product_path(product.id)
      end

      it 'product displayed' do
        visit product_path(product.id)
        expect(page).to have_content 'コーヒーの器具の名前'
      end
    end
  end
end
