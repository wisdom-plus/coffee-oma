# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  liked_id   :bigint
#  user_id    :integer
#
# Indexes
#
#  index_likes_on_created_at  (created_at)
#  index_likes_on_user_id     (user_id)
#
class BeanReviewLike < Like
  belongs_to :user
  belongs_to :bean_review, foreign_key: 'liked_id', inverse_of: :bean_review_likes
  counter_culture :bean_review, column_name: 'reviewlikes_count'

  def self.select_id(review_id)
    find { |n| n.liked_id == review_id }
  end

  def accociated_review
    bean_review
  end
end
