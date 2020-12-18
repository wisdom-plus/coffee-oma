# == Schema Information
#
# Table name: bean_reviews
#
#  id         :bigint           not null, primary key
#  acidity    :integer          default(0), not null
#  bitter     :integer          default(0), not null
#  content    :text(65535)      not null
#  flavor     :integer          default(0), not null
#  rich       :integer          default(0), not null
#  sweet      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bean_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_bean_reviews_on_bean_id  (bean_id)
#  index_bean_reviews_on_user_id  (user_id)
#
FactoryBot.define do
  factory :bean_review do
    
  end
end
