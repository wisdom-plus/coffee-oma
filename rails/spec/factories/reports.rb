# == Schema Information
#
# Table name: reports
#
#  id          :bigint           not null, primary key
#  review_type :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  review_id   :integer          not null
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
FactoryBot.define do
  factory :report do
    user
    review
  end
end
