require 'rails_helper'

RSpec.describe 'Notifications', type: :system do
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test2@example.com', username: 'test2') }
  let(:product) { create(:product) }
  let(:review) { create(:review, user: user, product: product) }
  let(:room) { create(:room, participant1: user, participant2: user1)}
  let(:message) { create(:message, room: room, user: user1)}
  let(:notification_follow) { create(:notification, visitor: user1, visited: user, action: 'follow') }
  let(:notification_like) { create(:notification, visitor: user1, visited: user, review: review, action: 'like') }
  let(:notification_message) { create(:notification, visitor: user1, visited: user, message: message, action: "message")}

  describe 'index' do
    context "when login" do
      before do
        notification_follow
        notification_like
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

    context "when not login" do
      it "not render page" do
        visit notifications_path
        expect(current_path).to eq new_user_session_path
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

  describe 'like_notification' do
    before do
      notification_like
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
