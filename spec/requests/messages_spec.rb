require 'rails_helper'

RSpec.describe "Messages", type: :request do
  let(:user) { create(:user)}
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test2') }
  let(:room) { create(:room, participant1: user, participant2: user1)}
  let(:message) { create(:message, user: user, room: room)}
  let(:message_params) { attributes_for(:message, user_id: user.id, room_id: room.id)}

  describe 'POST create' do
    before do
      user.confirm
      sign_in user
      room
    end

    it 'request message' do
      post messages_path, params: { message: message_params}
      expect(response).to have_http_status(:found)
    end

    it "created message" do
      expect do
        post messages_path, params: { message: message_params }
      end.to change(Message, :count).by 1
    end
  end

end
