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
#  index_reviews_on_created_at  (created_at)
#  index_reviews_on_product_id  (product_id)
#  index_reviews_on_user_id     (user_id)
#
class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :product_review_likes,
           foreign_key: 'liked_id',
           dependent: :destroy,
           inverse_of: :review

  has_many :notifications, dependent: :destroy
  has_many :reports, dependent: :destroy, as: :review
  counter_culture :product
  counter_culture :product, column_name: 'rate_sum', delta_column: 'rate'

  validates :title, :content, :user_id, :product_id, presence: true
  validates :rate, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }, presence: true

  scope :find_reviews, ->(review_id) { find_by(id: review_id) }
  scope :associated_review, ->(associated_id) { where(product_id: associated_id) }
  scope :associated_user_review, ->(associated_user_id) { where(user_id: associated_user_id) }
  scope :sort_by_created_at, -> { order('created_at DESC') }
  scope :exclude_reviews, ->(product_id, user_id) { ReviewsQuery.new.call(product_id, user_id) }

  def like_record(like_id)
    product_review_likes.find_by(user_id: like_id)
  end

  def create_notification_like(current_user)
    temp = Notification.review_like_notifications(current_user.id, user_id, id)
    notification = current_user.active_notifications.new(review_id: id, visited_id: user_id, action: 'like')
    return if temp.present?

    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save
  end

  def self.latest_review
    all.includes([:product], [:user]).sort_by_created_at.limit(TOP_DISPALY_NUM)
  end

  def self.show_review(product_id)
    includes(:user).associated_review(product_id)
  end

  def self.review_not_report(product_id)
    eager_load(:reports).where(product_id: product_id).where(reports: { user_id: nil })
  end

  def self.user_review(user_id)
    associated_user_review(user_id).includes(:product)
  end

  def self.others_reported_review(product_id, user_id)
    eager_load(:reports).where(product_id: product_id).where.not(reports: { user_id: user_id })
  end

  def self.review_exclude_report(product_id, user_id)
    review_not_report(product_id).or(others_reported_review(product_id, user_id))
  end
end
