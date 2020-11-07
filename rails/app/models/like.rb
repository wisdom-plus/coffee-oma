# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_likes_on_product_id  (product_id)
#  index_likes_on_user_id     (user_id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :user_id, :product_id, presence: true
  counter_culture :product
end
