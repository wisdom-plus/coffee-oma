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
class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :participant1, class_name: 'User', optional: true
  belongs_to :participant2, class_name: 'User', optional: true
  validate :check_participant

  def check_participant
    return unless participant1_id > participant2_id

    self.participant1_id, self.participant2_id = participant2_id, participant1_id
  end

  def another_user(user)
    if participant1_id == user.id
      participant2
    else
      participant1
    end
  end

  def self.find_room(user1, user2)
    if user1.id < user2.id
      Room.find_by(participant1_id: user1.id, participant2_id: user2.id)
    else
      Room.find_by(participant1_id: user2.id, participant2_id: user1.id)
    end
  end

  def self.room_new(current_user_id, user_id)
    if current_user_id > user_id.to_i
      Room.new(participant1_id: user_id, participant2_id: current_user_id)
    else
      Room.new(participant1_id: current_user_id, participant2_id: user_id)
    end
  end

  def self.where_room(current_user)
    Room.includes([:participant1], [:participant2]).where('participant1_id = ? or participant2_id = ?', current_user.id, current_user)
  end
end
