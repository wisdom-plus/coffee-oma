require 'rails_helper'

RSpec.describe "Notifications", type: :system do
  let(:user) { create(:user)}
  let(:user1) { create(:user, email: 'test2@example.com', username: 'test2') }
  let(:product) { create(:product) }
  let(:review) { create(:review, user: user, product: product) }
  let(:notification_follow) { create(:notification, visitor: user1, visited: user, action: "follow")}
  let(:notification_like) { create(:notification, visitor: user1, visited: user, review: review, action: "like")}

  describe 'index' do
    before do
      notification_follow
      notification_like
      login(user, user.email, user.password)
    end

    it 'render page' do
      visit notifications_path
      expect(page).to have_content "#{user1.username}さんにフォローされました"
      expect(page).to have_content "#{user1.username}さんがあなたのレビューにライクしました"
    end

    it "render new_notification icon" do
      visit root_path
      expect(page).to have_css ".new_notification"
    end

    it "not render new_notification icon" do
      visit notifications_path
      visit root_path
      expect(page).to have_no_css ".new_notification"
    end
  end

  describe "follow_notification" do
    before do
      login(user1, user1.email, user1.password)
      visit "/users/#{user.id}/show"
      click_link "フォローする"
      visit root_path
      click_link "ログアウト"
      login(user, user.email, user.password)
    end

    it "render new_notification icon" do
      visit root_path
      expect(page).to have_css ".new_notification"
    end

    it "create follow notification" do
      visit notifications_path
      expect(page).to have_content "#{user1.username}さんにフォローされました"
    end

    it "not render new_notification icon" do
      visit notifications_path
      visit root_path
      expect(page).to have_no_css ".new_notification"
    end
  end

  describe "like_notification" do
    before do
      review
      login(user1, user1.email, user1.password)
      visit product_path(product.id)
      click_link nil, href: review_likes_path(review_id: review.id)
      visit root_path
      click_link "ログアウト"
      login(user, user.email, user.password)
    end

    it "render new_notification icon" do
      visit root_path
      expect(page).to have_css ".new_notification"
    end

    it "create like notification" do
      visit notifications_path
      expect(page).to have_content "#{user1.username}さんがあなたのレビューにライクしました"
    end

    it "not render new_notification icon" do
      visit notifications_path
      visit root_path
      expect(page).to have_no_css ".new_notification"
    end
  end
end
