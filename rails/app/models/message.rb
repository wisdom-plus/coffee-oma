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

  def create_notification_message(current_user)
    temp = Notification.message_notification(current_user.id, room.another_user(current_user).id, id)
    return if temp.present?

    notification = current_user.active_notifications.new(message_id: id, visited_id: room.another_user(current_user).id, action: 'message')
    notification.save
  end

  def self.room_message(room_id)
    Message.includes([:user]).where('room_id = ?', room_id)
  end
end
