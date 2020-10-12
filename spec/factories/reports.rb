# == Schema Information
#
# Table name: reports
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  review_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_reports_on_review_id  (review_id)
#  index_reports_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (review_id => reviews.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :report do
    
  end
end
