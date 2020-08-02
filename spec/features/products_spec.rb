require 'rails_helper'

RSpec.describe "Products", type: :feature do
  let(:product) { create(:product)}

  describe 'product' do
    describe 'new' do
      it 'render page' do
        visit new_product_path
        expect(page).to have_current_path new_product_path
      end
    end

    describe 'create' do
      context 'redirect page' do

      end
    end

    describe 'index' do
      it 'render page' do
        visit products_path
        expect(page).to have_current_path products_path
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
    end
  end
end
