# == Schema Information
#
# Table name: bean_reviews
#
#  id      :bigint           not null, primary key
#  acidity :integer          default(0)
#  bitter  :integer          default(0)
#  content :text(65535)      not null
#  flavor  :integer          default(0)
#  rich    :integer          default(0)
#  sweet   :integer          default(0)
#  title   :string(255)      not null
#  bean_id :bigint
#
# Indexes
#
#  index_bean_reviews_on_bean_id  (bean_id)
#
FactoryBot.define do
  factory :bean_review do
    
  end
end
