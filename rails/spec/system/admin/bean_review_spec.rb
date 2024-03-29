require 'rails_helper'

RSpec.describe 'Admin bean_review' do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }
  let!(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:bean_review_like) { create(:bean_review_like, user: user, liked_id: bean_review.id) }

  describe 'bean_review' do
    before do
      admin_login(admin)
      visit admin_bean_reviews_path
    end

    it 'displayed index' do
      expect(page).to have_content 'コーヒー豆レビュー'
    end

    it 'displayed show' do
      visit admin_bean_review_path(bean_review.id)
      expect(page).to have_content bean_review.title
    end

    # なぜかsubmitが操作できない

    # it 'create resource' do
    #   visit new_admin_bean_review_path
    #   select bean.name, from: 'Bean'
    #   select user.username, from: 'User'
    #   fill_in '酸味', with: 1
    #   fill_in '苦味', with: 2
    #   fill_in 'コク', with: 3
    #   fill_in '風味', with: 4
    #   fill_in '甘み', with: 5
    #   fill_in 'タイトル', with: 'testタイトル'
    #   fill_in '投稿本文', with: 'testコンテンツ'
    #   expect(page).to have_current_path new_admin_bean_review_path
    #   expect(page).to have_content '取り消す'
    #   # find("input[data-disable-with='コーヒー豆レビューを作成']").click
    #   # expect(BeanReview.count).to eq 2
    # end

    it 'delete resource' do
      bean_review_like
      expect do
        visit admin_bean_review_path(bean_review.id)
        click_on 'コーヒー豆レビュー を削除する'
      end.to change(BeanReview, :count).by(-1)
    end
  end
end
