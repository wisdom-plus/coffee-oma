# == Schema Information
#
# Table name: histories
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bean_id    :bigint
#  product_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_histories_on_bean_id     (bean_id)
#  index_histories_on_product_id  (product_id)
#  index_histories_on_user_id     (user_id)
#
class History < ApplicationRecord
  belongs_to :user
  belongs_to :bean, optional: true, inverse_of: :histories
  belongs_to :product, optional: true, inverse_of: :histories

  scope :sort_by_updated, -> {order(updated_at: :DESC)}
end
