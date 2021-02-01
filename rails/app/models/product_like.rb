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
class ProductLike < Like
  belongs_to :product, optional: true, foreign_key: 'liked_id', inverse_of: :product_likes
  belongs_to :user
  counter_culture :product, column_name: 'likes_count'
end
