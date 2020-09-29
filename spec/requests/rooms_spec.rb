require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  let(:user) { create(:user)}
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test2') }
  let(:room) { create(:room, participant1: user, participant2: user1)}
  let(:message) { create(:message, user: user, room: room)}

  describe 'GET index' do
    before do
      user.confirm
      sign_in user
      room
      message
    end

    it 'request success' do
      get rooms_path
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
      post rooms_path, params: { user_id: user1.id}
      expect(response).to have_http_status(:found)
    end

    it 'created room' do
      expect do
        post rooms_path, params: { user_id: user1.id }
      end.to change(Room, :count).by 1
    end
  end
end
