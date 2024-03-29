# == Schema Information
#
# Table name: notifications
#
#  id          :bigint           not null, primary key
#  checked     :boolean          default(FALSE), not null
#  source_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  source_id   :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_notifications_on_checked     (checked)
#  index_notifications_on_created_at  (created_at)
#  index_notifications_on_source      (source_type,source_id)
#  index_notifications_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
# userは通知の受取手
# 通知の送信者はsenderで取り出すことができる
class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :source, polymorphic: true

  scope :history_order, -> { order(updated_at: :desc) }
  scope :checked_false, -> { where(checked: false) }
  scope :type_filter, ->(type) { select { |n| n.source_type == type } }

  def self.checked_notifications(user_id)
    notifications = Notification.where(user_id: user_id, checked: false)
    notifications.update_all(checked: true) # rubocop:disable Rails/SkipsModelValidations
  end

  def sender
    source.user
  end
end
