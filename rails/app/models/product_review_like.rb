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
#  index_likes_on_created_at  (created_at)
#  index_likes_on_user_id     (user_id)
#
class ProductReviewLike < Like
  belongs_to :user
  belongs_to :review, foreign_key: 'liked_id', inverse_of: :product_review_likes
  counter_culture :review, column_name: 'reviewlikes_count'


  def self.select_id(review_id)
    select {|n| n.liked_id == review_id}[0]
  end
end
