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
#
class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :participant1, class_name: 'User', optional: true
  belongs_to :participant2, class_name: "User", optional: true
  validate :check_participant

  def check_participant
    if self.participant1_id > self.participant2_id
      self.participant1_id, self.participant2_id = self.participant2_id, self.participant1_id
    end
  end

  def another_user(user)
    if self.participant1_id == user.id
      return self.participant2
    else
      return self.participant1
    end
  end


end
