require 'rails_helper'

RSpec.describe 'Reviews', type: :system do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:review) { create(:review, user: user, product: product) }

  describe 'review' do
    describe 'index' do
      before do
        visit product_reviews_path(product.id)
      end

      it 'render page' do
        expect(page).to have_current_path product_reviews_path(product.id)
      end
    end

    describe 'create' do
      before do
        login(user, user.email, user.password)
        visit product_path(product.id)
      end

      context 'seccess' do
        before do
          fill_in 'タイトル',	with: 'コーヒー器具のタイトル'
          fill_in 'レビュー内容',	with: 'コーヒー器具の内容'
          find('#review_rate', visible: false).set('1')
          click_button '  submit  '
        end

        it 'redirect page' do
          expect(page).to have_current_path product_path(product.id), ignore_query: true
        end

        it 'displayed review' do
          expect(page).to have_content 'コーヒー器具のタイトル'
          expect(find('.read')['data-rating']).to eq '1.0'
        end
      end

      context 'failure' do
        it 'black title' do
          fill_in 'タイトル',	with: ''
          fill_in 'レビュー内容',	with: 'コーヒー器具の内容'
          find('#review_rate', visible: false).set('1')
          click_button '  submit  '
          expect(page).to have_no_content 'コーヒー器具の内容'
        end

        it 'black content' do
          fill_in 'タイトル',	with: 'コーヒー器具のタイトル'
          fill_in 'レビュー内容',	with: ''
          find('#review_rate', visible: false).set('1')
          click_button '  submit  '
          expect(page).to have_no_content 'コーヒー器具のタイトル'
        end
      end
    end
  end
end
