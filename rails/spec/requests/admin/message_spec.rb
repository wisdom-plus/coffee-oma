require 'rails_helper'

RSpec.describe 'Admin' do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test2') }
  let(:room) { create(:room, participant1: user, participant2: user1) }

  describe 'Message' do
    it 'created resource' do
      room
      sign_in admin
      expect do
        post admin_messages_path, params: { message: attributes_for(:message, user_id: user.id, room_id: room.id) }
      end.to change(Message, :count).by 1
    end
  end
end
