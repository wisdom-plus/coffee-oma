# == Schema Information
#
# Table name: review_likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  review_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_review_likes_on_review_id  (review_id)
#  index_review_likes_on_user_id    (user_id)
#
class ReviewLike < ApplicationRecord
  belongs_to :user
  belongs_to :review
  counter_culture :review, column_name: 'reviewlikes_count'
end
