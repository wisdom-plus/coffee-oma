# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  action     :string(255)      default(""), not null
#  checked    :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  review_id  :integer
#  visited_id :integer          not null
#  visitor_id :integer          not null
#
# Indexes
#
#  index_notifications_on_visited_id  (visited_id)
#  index_notifications_on_visitor_id  (visitor_id)
#
class Notification < ApplicationRecord


  belongs_to :visitor_id, class_name: "User", foreign_key: "visitor_id", optional: true
  belongs_to :visited_id, class_name: "User", foreign_key: "visited_id", optional: true

end
