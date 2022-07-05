# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  action     :string(255)      default(""), not null
#  checked    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  record_id  :bigint           not null
#  user_id    :bigint
#
# Indexes
#
#  index_notifications_on_checked     (checked)
#  index_notifications_on_created_at  (created_at)
#  index_notifications_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :message, optional: true
  belongs_to :like, optional: true
  belongs_to :relationship,optional: true

  scope :history_order, -> { order(updated_at: :desc) }
  scope :checked_false, -> { where(checked: false) }
  scope :action_filter, ->(action) { select { |n| n.action == action } }

  def self.checked_notifications(user_id)
    user = User.find(user_id)
    user.passive_notifications.checked_false.update_all(checked: true) # rubocop:disable Rails/SkipsModelValidations
  end

  def self.follow_notification(current_user_id, follower_id)
    where(['visitor_id = ? and visited_id = ? and action = ?', current_user_id, follower_id, 'follow'])
  end
end
