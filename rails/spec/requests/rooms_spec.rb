require 'rails_helper'

RSpec.describe 'Rooms' do
  let_it_be(:user) { create(:user) }
  let_it_be(:another_user) { create(:user, :other_user) }
  let_it_be(:other_user) { create(:user, username: 'test3') }
  let(:follow) { create(:relationship, user: user, follow: another_user) }
  let(:another_follow) { create(:relationship, user: user, follow: other_user) }
  let(:room) { create(:room, participant1: user, participant2: another_user) }
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
      another_follow
    end

    it 'request success' do
      get new_room_path
      expect(response).to have_http_status(:ok)
    end

    it 'serach success' do
      get new_room_path, params: { q: other_user.username }
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
      post rooms_path, params: { user_id: another_user.id }
      expect(response).to have_http_status(:see_other)
    end

    it 'created room' do
      expect do
        post rooms_path, params: { user_id: another_user.id }
      end.to change(Room, :count).by 1
    end
  end
end
