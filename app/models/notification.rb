# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  action     :string(255)      default(""), not null
#  checked    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  review_id  :bigint
#  visited_id :bigint
#  visitor_id :bigint
#
# Indexes
#
#  index_notifications_on_review_id   (review_id)
#  index_notifications_on_visited_id  (visited_id)
#  index_notifications_on_visitor_id  (visitor_id)
#
# Foreign Keys
#
#  fk_rails_...  (review_id => reviews.id)
#  fk_rails_...  (visited_id => users.id)
#  fk_rails_...  (visitor_id => users.id)
#
class Notification < ApplicationRecord
  belongs_to :review, optional: true
  belongs_to :visitor, class_name: "User", foreign_key: "visitor_id", optional: true
  belongs_to :visited, class_name: "User", foreign_key: "visited_id", optional: true

  default_scope -> { order(created_at: :desc)}
end
