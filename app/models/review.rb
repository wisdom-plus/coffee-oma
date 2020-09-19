# == Schema Information
#
# Table name: reviews
#
#  id                :bigint           not null, primary key
#  content           :text(65535)      not null
#  rate              :float(24)
#  reviewlikes_count :integer          default(0), not null
#  title             :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_id        :bigint
#  user_id           :bigint
#
# Indexes
#
#  index_reviews_on_product_id  (product_id)
#  index_reviews_on_user_id     (user_id)
#
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :review_likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  validates :title, :content, :user_id, :product_id, presence: true
  validates :rate, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }, presence: true

  def like_record(liker_id)
    review_likes.find_by(user_id: liker_id)
  end

  def create_notification_like(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and review_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    if temp.blank?
      notification = current_user.active_notifications.new(review_id: id, visited_id: user_id, action: "like")
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save
    end
  end

end
