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
class BeanLike < Like
  belongs_to :bean, optional: true, foreign_key: 'liked_id', inverse_of: :bean_likes
  belongs_to :user
  counter_culture :bean, column_name: 'likes_count'

  def liked
    bean
  end
end
