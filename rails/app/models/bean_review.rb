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
  counter_culture :bean

  scope :accociated_review, ->(associated_id) { where('bean_id= ?', associated_id) }
  scope :find_reviews, ->(review_id) { find_by(id: review_id) }
  scope :like_record, ->(liker_id) { bean_review_likes.find_by(user_id: liker_id) }

  def like_record(liker_id)
    bean_review_likes.find_by(user_id: liker_id)
  end

  def self.show_review(bean_id, page)
    BeanReview.accociated_review(bean_id).includes([:user], [:recipe]).page(page).per(SHOW_DISPLAY_NUM)
  end
end
