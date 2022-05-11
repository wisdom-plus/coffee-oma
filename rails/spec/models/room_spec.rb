require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test2@example.com', username: 'test2') }
  let(:user2) { create(:user, email: 'test3@example.com', username: 'test3') }
  let(:room) { create(:room, participant1: user, participant2: user1) }
  let(:room1) { create(:room, participant1: user1, participant2: user2) }

  describe 'class method' do
    it 'find_room(user,user1)' do
      room
      r = Room.find_room(user,user1)
      r1 = Room.find_room(user1,user)
      expect(r).to eq room
      expect(r1).to eq room
    end

    it 'room_new(user,user1)' do
      r = Room.room_new(user.id,user1.id)
      expect(r.participant1_id).to eq user.id
      expect(r.participant2_id).to eq user1.id
    end

    it 'room_new(user1,user2)' do
      r = Room.room_new(user2.id,user.id)
      expect(r.participant1_id).to eq user2.id
      expect(r.participant2_id).to eq user.id
    end
  end

  describe 'instance method' do
    it 'another_user' do
      room
      r = Room.find_room(user,user1)
      expect(r.another_user(user)).to eq user1
      expect(r.another_user(user1)).to eq user
    end
  end
end
