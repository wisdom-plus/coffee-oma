# == Schema Information
#
# Table name: reports
#
#  id          :bigint           not null, primary key
#  review_type :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  review_id   :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_reports_on_review_type_and_review_id  (review_type,review_id)
#  index_reports_on_user_id                    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Report < ApplicationRecord
  belongs_to :user
  belongs_to :review, polymorphic: true

  def self.create_report(user, review)
    user.reports.find_or_create_by(review: review)
    DeleteReviewJob.perform_later(review) if review.reports.size > 9
  end
end
