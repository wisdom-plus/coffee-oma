require 'rails_helper'

RSpec.describe 'Products', type: :system do
  let(:product) { create(:product, tag_list: 'コーヒー') }
  let(:product1) { create(:product, itemname: '器具の名前が入ります', tag_list: '豆') }
  let(:user) { create(:user) }

  describe 'new' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
        visit new_product_path
      end

      it 'create product' do
        expect do
          fill_in 'item-name', with: 'コーヒーの器具の名前'
          fill_in 'shop-name', with: 'コーヒーのメーカー'
          fill_in 'item-price', with: '1000'
          fill_in 'item-caption', with: 'アイテムの説明文が入ります'
          find('#tag', visible: false).set('コーヒー,豆')
          click_on 'submit'
        end.to change(Product, :count).by 1
      end

      it 'redirect index(product)' do
        fill_in 'item-name', with: 'コーヒーの器具の名前'
        fill_in 'shop-name', with: 'コーヒーのメーカー'
        fill_in 'item-price', with: '1000'
        fill_in 'item-caption', with: 'アイテムの説明文が入ります'
        find('#tag', visible: false).set('コーヒー,豆')
        click_on 'submit'
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

    it 'displayed product' do
      link = first('.ui.fluid.link.card')
      expect(link[:href]).to eq product_path(product.id)
    end

    it 'redirect show' do
      click_link nil, href: product_path(product.id)
      expect(page).to have_current_path product_path(product.id), ignore_query: true
    end

    it 'search product' do
      fill_in 'search',	with: 'コーヒー'
      find('.ui.icon.teal.button').click
      expect(page).to have_content 'コーヒーの器具の名前'
    end

    it 'not search product1' do
      fill_in 'search',	with: 'コーヒー'
      find('.ui.icon.teal.button').click
      expect(page).to have_no_content '器具の名前が入ります'
    end

    it 'search product tag' do
      visit products_path(tag_name: 'コーヒー')
      expect(page).to have_content 'コーヒーの器具の名前'
    end
  end

  describe 'show' do
    before do
      product
    end

    context 'when login' do
      before do
        login(user, user.email, user.password)
        visit product_path(product.id)
      end

      it 'product displayed' do
        expect(page).to have_content 'コーヒーの器具の名前'
      end

      it 'display tag' do
        expect(page).to have_css '.ui.teal.tag.label'
      end

      it 'redirect index(tag)' do
        click_on 'コーヒー (1)'
        expect(page).to have_current_path products_path, ignore_query: true
      end
    end
  end

  context 'when not login' do
    it 'not displayed tag_form' do
      expect(page).to have_no_css '.tag_form'
    end

    it 'not displayed review_form' do
      expect(page).to have_no_css '#review_form'
    end

    it 'not displayed like_button' do
      expect(page).to have_no_css '#like_button'
    end
  end
end
