require 'rails_helper'

RSpec.describe 'Reviews', type: :system do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:review) { create(:review, user: user, product: product) }

  describe 'create' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
        visit product_path(product.id)
      end

      context 'success' do
        before do
          fill_in 'タイトル',	with: 'レビューのタイトル'
          fill_in 'レビュー内容',	with: 'レビューの内容'
          find('#review_rate', visible: false).set('1')
          click_button '  submit  '
        end

        it 'redirect product page' do
          expect(page).to have_current_path product_path(product.id), ignore_query: true
        end

        it 'displayed review' do
          expect(page).to have_content 'レビューのタイトル'
          expect(find('.read')['data-rating']).to eq '1.0'
        end
      end

      context 'failure' do
        it 'has blank title' do
          fill_in 'タイトル',	with: ''
          fill_in 'レビュー内容',	with: 'レビューの内容'
          find('#review_rate', visible: false).set('1')
          click_button '  submit  '
          expect(page).to have_content 'レビューの登録に失敗しました'
        end

        it 'has blank content' do
          fill_in 'タイトル',	with: 'レビューのタイトル'
          fill_in 'レビュー内容',	with: ''
          find('#review_rate', visible: false).set('1')
          click_button '  submit  '
          expect(page).to have_content 'レビューの登録に失敗しました'
        end

        it 'has blank rate' do
          fill_in 'タイトル',	with: 'レビューのタイトル'
          fill_in 'レビュー内容',	with: 'レビューの内容'
          click_button '  submit  '
          expect(page).to have_content 'レビューの登録に失敗しました'
        end
      end
    end

    context 'when not login' do
      it 'is not render review_form' do
        visit product_path(product.id)
        expect(page).to have_no_css '#review_form'
      end
    end
  end
end
