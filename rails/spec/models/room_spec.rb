# == Schema Information
#
# Table name: rooms
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  participant1_id :bigint           not null
#  participant2_id :bigint           not null
#
# Indexes
#
#  index_rooms_on_participant1_id  (participant1_id)
#  index_rooms_on_participant2_id  (participant2_id)
#  uique_partcipant1_partcipant2   (participant1_id,participant2_id) UNIQUE
#
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
      r = Room.find_room(user, user1)
      r1 = Room.find_room(user1, user)
      expect(r).to eq room
      expect(r1).to eq room
    end

    it 'room_new(user,user1)' do
      r = Room.room_new(user.id, user1.id)
      expect(r.participant1_id).to eq user.id
      expect(r.participant2_id).to eq user1.id
    end

    it 'room_new(user1,user2)' do
      user
      user2
      r = Room.room_new(user2.id, user.id)
      expect(r.participant1_id).to eq user.id
      expect(r.participant2_id).to eq user2.id
    end
  end

  describe 'instance method' do
    it 'another_user' do
      room
      r = Room.find_room(user, user1)
      expect(r.another_user(user)).to eq user1
      expect(r.another_user(user1)).to eq user
    end

    it 'check_participant(1 < 2)' do
      user
      user1
      r = Room.new(participant1_id:user.id, participant2_id:user1.id)
      r.save
      expect(Room.last.participant1_id).to eq user.id
    end

    it 'check_participant(2 > 1)' do
      user
      user1
      r = Room.new(participant1_id:user1.id, participant2_id:user.id)
      r.save
      expect(Room.last.participant1_id).to eq user.id
    end
  end
end
