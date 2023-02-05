require 'rails_helper'

RSpec.describe 'BeanReviews' do
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }

  describe 'create' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
        visit bean_path(bean.id)
      end

      it 'created success' do
        expect do
          fill_in 'title', with: 'レビューのタイトル'
          fill_in 'content', with: 'レビューの内容'
          find_by_id('bean_review_acidity', visible: false).set('1')
          find_by_id('bean_review_bitter', visible: false).set('2')
          find_by_id('bean_review_rich', visible: false).set('3')
          find_by_id('bean_review_flavor', visible: false).set('4')
          find_by_id('bean_review_sweet', visible: false).set('5')
          click_button 'submit'
        end.to change(BeanReview, :count).by 1
      end

      it 'not created success' do
        expect do
          fill_in 'title', with: 'レビューのタイトル'
          fill_in 'content', with: ''
          find_by_id('bean_review_acidity', visible: false).set('1')
          find_by_id('bean_review_bitter', visible: false).set('2')
          find_by_id('bean_review_rich', visible: false).set('3')
          find_by_id('bean_review_flavor', visible: false).set('4')
          find_by_id('bean_review_sweet', visible: false).set('5')
          click_button 'submit'
        end.not_to change(BeanReview, :count)
      end
    end

    context 'when not login' do
      it 'is not render review_form' do
        visit bean_path(bean.id)
        expect(page).not_to have_css '#bean_review_form'
      end
    end
  end
end
