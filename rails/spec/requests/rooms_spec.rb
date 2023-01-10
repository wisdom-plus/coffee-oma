require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  let_it_be(:user) { create(:user) }
  let_it_be(:user1) { create(:user, :other_user) }
  let_it_be(:user2) { create(:user, email: 'test2@example.com', username: 'test3') }
  let(:follow) { create(:relationship, user: user, follow: user1) }
  let(:follow2) { create(:relationship, user: user, follow: user2) }
  let(:room) { create(:room, participant1: user, participant2: user1) }
  let(:message) { create(:message, user: user, room: room) }

  describe 'GET index' do
    it 'request success' do
      user.confirm
      sign_in user
      room
      message
      get rooms_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET new' do
    before do
      user.confirm
      sign_in user
      follow
      follow2
    end

    it 'request success' do
      get new_room_path
      expect(response).to have_http_status(:ok)
    end

    it 'serach success' do
      get new_room_path, params: { q: user2.username }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET show' do
    before do
      user.confirm
      sign_in user
      message
    end

    it 'request success' do
      get room_path(room.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST create' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success' do
      post rooms_path, params: { user_id: user1.id }
      expect(response).to have_http_status(:see_other)
    end

    it 'created room' do
      expect do
        post rooms_path, params: { user_id: user1.id }
      end.to change(Room, :count).by 1
    end
  end
end
