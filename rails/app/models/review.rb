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
  include ActionView::Helpers::DateHelper

  belongs_to :product
  belongs_to :user
  has_many :product_review_likes,
           foreign_key: 'liked_id',
           dependent: :destroy,
           inverse_of: :review
  has_many :reports, dependent: :destroy, as: :review

  counter_culture :product
  counter_culture :product, column_name: 'rate_sum', delta_column: 'rate'

  validates :title, :content, presence: true
  validates :rate, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }, presence: true

  scope :find_reviews, ->(review_id) { find_by(id: review_id) }
  scope :associated_review, ->(associated_id) { where(product_id: associated_id) }
  scope :associated_user_review, ->(associated_user_id) { where(user_id: associated_user_id) }
  scope :sort_by_created_at, -> { order('created_at DESC') }
  scope :exclude_reviews, ->(product_id, user_id) { ExcludeReportedReviewsQuery.call(product_id, user_id) }

  def self.latest_review
    all.includes([:user], product: :thread_image).sort_by_created_at.limit(TOP_DISPALY_NUM)
  end

  def self.show_review(product_id)
    includes(:user).associated_review(product_id)
  end

  def self.user_review(user_id)
    associated_user_review(user_id).includes(:product)
  end

  def self.api_json(product_id)
    reviews = where(product_id: product_id)
    reviews.map(&:as_json)
  end

  def as_json
    {
      id: id,
      title: title,
      content: content,
      rate: rate,
      time_ago: time_ago_in_words(created_at),
      user_id: user_id
    }
  end
end
