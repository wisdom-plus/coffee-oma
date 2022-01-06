# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  action     :string(255)      default(""), not null
#  checked    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  like_id    :bigint
#  message_id :bigint
#  visited_id :bigint
#  visitor_id :bigint
#
# Indexes
#
#  index_notifications_on_checked     (checked)
#  index_notifications_on_created_at  (created_at)
#  index_notifications_on_like_id     (like_id)
#  index_notifications_on_message_id  (message_id)
#  index_notifications_on_visited_id  (visited_id)
#  index_notifications_on_visitor_id  (visitor_id)
#
# Foreign Keys
#
#  fk_rails_...  (like_id => likes.id)
#  fk_rails_...  (message_id => messages.id)
#  fk_rails_...  (visited_id => users.id)
#  fk_rails_...  (visitor_id => users.id)
#
FactoryBot.define do
  factory :notification do
    association :visited, factory: :user
  end
end
