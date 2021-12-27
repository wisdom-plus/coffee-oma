# == Schema Information
#
# Table name: bean_reviews
#
#  id                :bigint           not null, primary key
#  acidity           :integer
#  bitter            :integer
#  content           :text(65535)      not null
#  flavor            :integer
#  reviewlikes_count :integer          default(0), not null
#  rich              :integer
#  sweet             :integer
#  title             :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  bean_id           :bigint
#  user_id           :bigint
#
# Indexes
#
#  index_bean_reviews_on_bean_id     (bean_id)
#  index_bean_reviews_on_created_at  (created_at)
#  index_bean_reviews_on_user_id     (user_id)
#
class BeanReview < ApplicationRecord
  has_one :recipe, dependent: :destroy
  belongs_to :bean
  belongs_to :user
  has_many :reports, dependent: :destroy, as: :review
  has_many :bean_review_likes,
           foreign_key: 'liked_id',
           dependent: :destroy,
           inverse_of: :bean_review
  counter_culture :bean, column_name: 'reviews_count'

  scope :accociated_review, ->(associated_id) { where(bean_id: associated_id) }
  scope :find_reviews, ->(review_id) { find_by(id: review_id) }
  scope :evaluations, -> {
                        pluck("AVG(acidity) AS acidity_sum ,
                              AVG(bitter) AS bitter_sum,
                              AVG(sweet) AS sweet_sum,
                              AVG(rich) AS rich_sum,
                              AVG(flavor) AS flavor_sum")[0].map(&:to_s)
                      }

  def like_record(liker_id)
    bean_review_likes.find_by(user_id: liker_id)
  end

  def self.show_review(bean_id)
    accociated_review(bean_id).includes([:user], [:recipe])
  end

  def self.review_not_report(bean_id)
    eager_load(:reports).where(bean_id: bean_id).where(reports: { user_id: nil })
  end

  def self.others_reported_review(bean_id, user_id)
    eager_load(:reports).where(bean_id: bean_id).where.not(reports: { user_id: user_id })
  end

  def self.review_exclude_report(bean_id, user_id)
    review_not_report(bean_id).or(others_reported_review(bean_id, user_id))
  end
end
