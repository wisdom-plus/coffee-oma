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

RSpec.describe Room do
  let(:user) { create(:user) }
  let(:other_user) { create(:user, username: 'test2') }
  let(:another_user) { create(:user, username: 'test3') }
  let(:room) { create(:room, participant1: user, participant2: other_user) }
  let(:another_room) { create(:room, participant1: other_user, participant2: another_user) }

  describe 'class method' do
    it 'find_room(user,other_user)' do
      room
      r = Room.find_room(user.id, other_user.id)
      r1 = Room.find_room(other_user.id, user.id)
      expect(r).to eq room
      expect(r1).to eq room
    end

    it 'room_new(user,other_user)' do
      r = Room.room_new(user.id, other_user.id)
      expect(r.participant1_id).to eq user.id
      expect(r.participant2_id).to eq other_user.id
    end

    it 'room_new(other_user,another_user)' do
      user
      another_user
      r = Room.room_new(another_user.id, user.id)
      expect(r.participant1_id).to eq user.id
      expect(r.participant2_id).to eq another_user.id
    end
  end

  describe 'instance method' do
    it 'another_user' do
      room
      r = Room.find_room(user.id, other_user.id)
      expect(r.another_user(user)).to eq other_user
      expect(r.another_user(other_user)).to eq user
    end

    it 'check_participant(1 < 2)' do
      user
      other_user
      r = Room.new(participant1_id: user.id, participant2_id: other_user.id)
      r.save
      expect(Room.last.participant1_id).to eq user.id
    end

    it 'check_participant(2 > 1)' do
      user
      other_user
      r = Room.new(participant1_id: other_user.id, participant2_id: user.id)
      r.save
      expect(Room.last.participant1_id).to eq user.id
    end
  end
end
