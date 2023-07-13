require 'rails_helper'

RSpec.describe 'Component::Notifications' do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user, product: product) }
  let(:product_review_like) { create(:product_review_like, user: user1, liked_id: review.id) }
  let(:follow) { create(:relationship, user: user, follow: user) }
  let(:room) { create(:room, participant1: user, participant2: user1) }
  let(:message) { create(:message, room: room, user: user1) }
  let(:follow_notification) { create(:notification, source: follow, user: user) }
  let(:like_notification) { create(:notification, source: product_review_like, user: user) }
  let(:message_notification) { create(:notification, source: message, user: user) }

  describe 'GET /bell' do
    it 'request success' do
      user.confirm
      sign_in user
      follow_notification
      get bell_component_notifications_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /follow' do
    it 'request success' do
      user.confirm
      sign_in user
      follow_notification
      get follow_component_notifications_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /like' do
    it 'request success' do
      user.confirm
      sign_in user
      like_notification
      get like_component_notifications_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /mesasge' do
    it 'request success' do
      user.confirm
      sign_in user
      message_notification
      get message_component_notifications_path
      expect(response).to have_http_status(:ok)
    end
  end
end
