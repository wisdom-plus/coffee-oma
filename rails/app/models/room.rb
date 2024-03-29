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

  scope :room_list, ->(user_id) { where('participant1_id = ? or participant2_id = ?', user_id, user_id) }

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

  def self.find_room(user1_id, user2_id)
    if user1_id < user2_id
      find_by(participant1_id: user1_id, participant2_id: user2_id)
    else
      find_by(participant1_id: user2_id, participant2_id: user1_id)
    end
  end

  def self.room_new(user_id, another_user_id)
    if user_id > another_user_id
      new(participant1_id: another_user_id, participant2_id: user_id)
    else
      new(participant1_id: user_id, participant2_id: another_user_id)
    end
  end

  def self.join_room_list(current_user)
    Room.includes([:participant1], [:participant2], [:messages]).room_list(current_user.id)
  end

  def join?(user_id)
    participant1_id == user_id || participant2_id == user_id
  end
end
