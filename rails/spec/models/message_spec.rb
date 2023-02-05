# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  message    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_room_id  (room_id)
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Message do
  let(:user) { create(:user) }
  let(:other_user) { create(:user, :other_user) }
  let(:room) { create(:room, participant1: user, participant2: other_user) }
  let(:message) { create(:message, user: user, room: room) }

  it 'is valid with a message' do
    build_message = build(:message, user: user, room: room, message: '')
    expect(build_message.valid?).to be false
  end

  it 'get messages associated a room' do
    message
    message1 = create(:message, user: user, room: room, message: 'message1')
    expect(Message.room_message(room.id)).to eq [message, message1]
  end

  it 'get receiver' do
    message
    expect(message.receiver).to eq other_user
  end
end
