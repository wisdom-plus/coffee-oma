require 'rails_helper'

RSpec.describe 'Notifications', type: :system do
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test2@example.com', username: 'test2') }
  let(:follow) { create(:relationship, user: user1, follow: user)}
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user, product: product) }
  let(:product_review_like) { create(:like, user: user1, liked_id: review.id, type: 'ProductReviewLike') }
  let(:bean) { create(:bean, user: user)}
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:bean_review_like) { create(:like, user: user1, liked_id: bean_review.id, type: 'BeanReviewLike') }
  let(:room) { create(:room, participant1: user, participant2: user1) }
  let(:message) { create(:message, room: room, user: user1) }
  let(:notification_follow) { create(:notification, user: user, source: follow) }
  let(:notification_product_review_like) { create(:notification, user: user, source: product_review_like ) }
  let(:notification_bean_review_like) { create(:notification, user: user, source: bean_review_like ) }
  let(:notification_message) { create(:notification,user: user, source: message) }

  describe 'index' do
    context 'when login' do
      before do
        notification_follow
        notification_product_review_like
        notification_message
        login(user, user.email, user.password)
      end

      it 'render page' do
        visit notifications_path
        expect(page).to have_content "#{user1.username}さんにフォローされました"
        expect(page).to have_content "#{user1.username}さんがあなたのレビューにライクしました"
        expect(page).to have_content "#{user1.username}さんからメッセージが届きました"
      end

      it 'render new_notification icon' do
        visit root_path
        expect(page).to have_css '.new_notification'
      end

      it 'not render new_notification icon' do
        visit notifications_path
        visit root_path
        expect(page).to have_no_css '.new_notification'
      end
    end

    context 'when not login' do
      it 'not render page' do
        visit notifications_path
        expect(page).to have_current_path new_user_session_path, ignore_query: true
      end
    end
  end

  describe 'follow_notification' do
    before do
      notification_follow
      login(user, user.email, user.password)
    end

    it 'render new_notification icon' do
      visit root_path
      expect(page).to have_css '.new_notification'
    end

    it 'create follow notification' do
      visit notifications_path
      expect(page).to have_content "#{user1.username}さんにフォローされました"
    end

    it 'not render new_notification icon' do
      visit notifications_path
      visit root_path
      expect(page).to have_no_css '.new_notification'
    end
  end

  describe 'product_review_like_notification' do
    before do
      notification_bean_review_like
      login(user, user.email, user.password)
    end

    it 'render new_notification icon' do
      visit root_path
      expect(page).to have_css '.new_notification'
    end

    it 'create like notification' do
      visit notifications_path
      expect(page).to have_content "#{user1.username}さんがあなたのレビューにライクしました"
    end

    it 'not render new_notification icon' do
      visit notifications_path
      visit root_path
      expect(page).to have_no_css '.new_notification'
    end
  end

  describe 'bean_review_like_notification' do
    before do
      notification_product_review_like
      login(user, user.email, user.password)
    end

    it 'render new_notification icon' do
      visit root_path
      expect(page).to have_css '.new_notification'
    end

    it 'create like notification' do
      visit notifications_path
      expect(page).to have_content "#{user1.username}さんがあなたのレビューにライクしました"
    end

    it 'not render new_notification icon' do
      visit notifications_path
      visit root_path
      expect(page).to have_no_css '.new_notification'
    end
  end


  describe 'message_notification' do
    before do
      notification_message
      login(user, user.email, user.password)
    end

    it 'render new_notification icon' do
      visit root_path
      expect(page).to have_css '.new_notification'
    end

    it 'create like notification' do
      visit notifications_path
      expect(page).to have_content "#{user1.username}さんからメッセージが届きました"
    end

    it 'not render new_notification icon' do
      visit notifications_path
      visit root_path
      expect(page).to have_no_css '.new_notification'
    end
  end
end
