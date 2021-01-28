# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  liked_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_likes_on_user_id  (user_id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true
  belongs_to :bean, optional: true
  validates :user_id, :product_id, presence: true
  counter_culture :product
end
