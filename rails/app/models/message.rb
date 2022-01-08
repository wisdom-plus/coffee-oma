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
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy
  validates :message, presence: true

  scope :associated_message, ->(room_id) { where(room_id: room_id) }

  def create_notification_message(current_user)
    notification = current_user.create_message_notificatin(id, room.another_user(current_user).id)
    notification.save
  end

  def self.room_message(room_id)
    Message.includes([:user]).associated_message(room_id)
  end
end
