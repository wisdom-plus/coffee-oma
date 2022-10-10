require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  let_it_be(:user) { create(:user) }
  let_it_be(:user1) { create(:user, :other_user) }
  let_it_be(:room) { create(:room, participant1: user, participant2: user1) }
  let_it_be(:message) { create(:message, user: user, room: room) }
  let_it_be(:message_params) { attributes_for(:message) }

  describe 'POST create' do
    before do
      user.confirm
      sign_in user
      room
    end

    it 'request message' do
      post messages_path, params: { message: message_params, room_id: room.id }
      expect(response).to have_http_status(:no_content)
    end

    it 'created message' do
      expect do
        post messages_path, params: { message: message_params, room_id: room.id }
      end.to change(Message, :count).by 1
    end
  end
end
