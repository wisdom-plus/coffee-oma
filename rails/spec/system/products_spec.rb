require 'rails_helper'

RSpec.describe 'Products' do
  let(:user) { create(:user) }
  let(:brand) { create(:brand) }
  let(:product) { create(:product, tag_list: 'コーヒー', user: user, brand: brand) }
  let(:product1) { create(:product, name: '器具の名前が入ります', tag_list: '豆', user: user) }

  describe 'new' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
        visit new_product_path
      end

      it 'create product and redirect to index' do
        expect do
          fill_in 'item-name', with: 'コーヒーの器具の名前'
          fill_in 'item-price', with: '1000'
          fill_in 'item-caption', with: 'アイテムの説明文が入ります'
          find_by_id('tag', visible: false).set('コーヒー,豆')
          click_on 'submit'
        end.to change(Product, :count).by 1
        expect(page).to have_current_path products_path, ignore_query: true
      end
    end

    context 'when not login' do
      it 'redirect sign_in' do
        visit new_product_path
        expect(page).to have_current_path new_user_session_path, ignore_query: true
      end
    end
  end

  describe 'index' do
    before do
      product
      product1
      visit products_path
    end

    it 'displayed product and click render show' do
      link = first('.ui.fluid.link.card')
      expect(link[:href]).to eq product_path(product.id)

      click_link nil, href: product_path(product.id)
      expect(page).to have_current_path product_path(product.id), ignore_query: true
    end

    it 'search product' do
      fill_in 'search',	with: 'コーヒー'
      find_by_id('search').click
      expect(page).to have_content 'コーヒーの器具の名前'
      expect(page).not_to have_content '器具の名前が入ります'

      visit products_path(tag_name: 'コーヒー')
      expect(page).to have_content 'コーヒーの器具の名前'
    end
  end

  describe 'show' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
      end

      it 'display product and redirect to index' do
        visit product_path(product.id)
        expect(page).to have_content 'コーヒーの器具の名前'
        expect(page).to have_css '.ui.teal.tag.label'

        click_on 'コーヒー (1)'
        expect(page).to have_current_path products_path, ignore_query: true
      end

      it 'redirect index(product not exists)' do
        visit product_path(product.id + 1)
        expect(page).to have_current_path products_path, ignore_query: true
        expect(page).to have_content '存在しないページです。'
      end
    end
  end

  context 'when not login' do
    it 'not displayed' do
      expect(page).not_to have_css '.tag_form'
      expect(page).not_to have_css '#review_form'
      expect(page).not_to have_css '#like_button'
    end
  end
end
