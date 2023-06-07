require 'rails_helper'

RSpec.describe 'Brands' do
  let(:brand) { create(:brand) }
  let(:brand_params) { attributes_for(:brand) }

  describe 'index' do
    before do
      brand
    end

    it 'show all brands' do
      visit brands_path
      expect(page).to have_content brand.name
    end
  end

  describe 'show' do
    before do
      brand
    end

    it 'show brand' do
      visit brand_path(brand)
      expect(page).to have_content brand.name
      expect(page).to have_content brand.description
      expect(page).to have_link find_by_id('site_link')['href']
    end
  end

  describe 'new' do
    it 'create new brand' do
      visit new_brand_path
      expect do
        fill_in 'name', with: brand_params[:name]
        fill_in 'description', with: brand_params[:description]
        fill_in 'website', with: brand_params[:website]
        click_on 'submit'
      end.to change(Brand, :count).by 1
      expect(page).to have_current_path brands_path, ignore_query: true
    end
  end

  describe 'edit' do
    before do
      brand
    end

    it 'update brand' do
      visit edit_brand_path(brand)

      fill_in 'name', with: 'edit-coffee-brand'
      click_on 'submit'

      expect(brand.reload.name).to eq 'edit-coffee-brand'
      expect(page).to have_current_path brands_path, ignore_query: true
    end
  end
end
