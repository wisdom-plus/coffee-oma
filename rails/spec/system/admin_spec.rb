require 'rails_helper'

RSpec.describe 'Admin', type: :system do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1) { create(:user, username: 'test1', email: 'test1@example.com')}
  let(:bean) { create(:bean, user: user) }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user, product: product) }
  let(:product_like) { create(:like, user: user, liked_id: product.id, type: 'ProductLike') }
  let(:bean_like) { create(:like, user: user, liked_id: bean.id, type: 'BeanLike') }
  let(:bean_review) { create(:bean_review, bean: bean, user: user) }
  let(:product_review_like) { create(:like, user: user, liked_id: review.id, type: 'ProductReviewLike') }
  let(:bean_review_like) { create(:like, user: user, liked_id: bean_review.id, type: 'BeanReviewLike') }
  let(:follow) { create(:relationship, user: user, follow: user1)}

  describe 'dashborad' do
    before do
      admin_login(admin)
      visit admin_root_path
    end

    it 'display dashborad' do
      expect(page).to have_content 'ダッシュボード'
      expect(page).to have_current_path admin_root_path
    end
  end

  describe 'bean_review' do
    before do
      admin_login(admin)
      bean_review_like
      visit admin_bean_reviews_path
    end

    it 'displayed index' do
      expect(page).to have_content 'コーヒー豆レビュー'
    end

    it 'displayed show' do
      visit admin_bean_review_path(bean_review.id)
      expect(page).to have_content bean_review.title
      expect(page).to have_content user.username
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
      expect do
        visit admin_bean_review_path(bean_review.id)
        click_on 'コーヒー豆レビュー を削除する'
      end.to change(BeanReview, :count).by(-1)
    end
  end

  describe 'bean' do
    before do
      admin_login(admin)
      bean_like
      visit admin_beans_path
    end

    it 'displayed index' do
      expect(page).to have_content 'コーヒー豆'
    end

    it 'displayed show' do
      visit admin_bean_path(bean.id)
      expect(page).to have_content bean.name
    end

    it 'delete resource' do
      expect do
        visit admin_bean_path(bean.id)
        click_on 'コーヒー豆 を削除する'
      end.to change(Bean, :count).by(-1)
    end
  end

  describe 'product' do
    before do
      admin_login(admin)
      review
      product_like
      visit admin_products_path
    end

    it 'displayed index' do
      expect(page).to have_content '商品'
    end

    it 'displayed show' do
      visit admin_product_path(product.id)
      expect(page).to have_content product.itemname
    end

    it 'delete resource' do
      expect do
        visit admin_product_path(product.id)
        click_on '商品 を削除する'
      end.to change(Product, :count).by(-1)
    end
  end

  describe 'review' do
    before do
      admin_login(admin)
      product_review_like
      visit admin_reviews_path
    end

    it 'displayed index' do
      expect(page).to have_content '商品レビュー'
    end

    it 'displayed' do
      visit admin_review_path(review.id)
      expect(page).to have_content review.title
    end

    it 'delete resource' do
      expect do
        visit admin_review_path(review.id)
        click_on '商品レビュー を削除する'
      end.to change(Review, :count).by(-1)
    end
  end

  describe 'relationship' do
    before do
      admin_login(admin)
      follow
      visit admin_relationships_path
    end

    it 'displayed index' do
      expect(page).to have_content 'フォロー'
    end

    it 'displayed show' do
      visit admin_relationship_path(follow.id)
      expect(page).to have_content user1.username
      expect(page).to have_content user.username
    end

    it 'delete resource' do
      expect do
        visit admin_relationship_path(follow.id)
        click_on 'フォロー を削除する'
      end.to change(Relationship, :count).by(-1)
    end
  end
end
