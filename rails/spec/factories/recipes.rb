# == Schema Information
#
# Table name: recipes
#
#  id             :bigint           not null, primary key
#  amount         :integer          not null
#  grinding       :integer          default("極細挽き"), not null
#  powdergram     :integer          not null
#  temperature    :integer          not null
#  time           :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  bean_review_id :bigint
#
# Indexes
#
#  index_recipes_on_bean_review_id  (bean_review_id)
#
# Foreign Keys
#
#  fk_rails_...  (bean_review_id => bean_reviews.id)
#
FactoryBot.define do
  factory :recipe do
    user
    amount { 220 }
    grinding { '細かい' }
    powdergram { 18 }
    temperature { 92 }
    time { 180 }
    status { false }
  end
end
