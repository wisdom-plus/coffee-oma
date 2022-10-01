require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) { create(:user) }
  let(:other_user) { create(:user, :other_user) }
  let(:room) { create(:room, participant1: user, participant2: other_user) }
  let(:message) { create(:message, user: user, room: room) }

  it "is valid with a message" do
    build_message = build(:message, user: user, room: room, message: '')
    expect(build_message.valid?).to eq false
  end

  it "get messages associated a room" do
    message
    message1 = create(:message, user: user, room: room, message: 'message1')
    expect(Message.room_message(room.id)).to eq [message, message1]
  end

  it "get receiver" do
    message
    expect(message.receiver).to eq other_user
  end
end
