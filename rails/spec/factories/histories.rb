# == Schema Information
#
# Table name: histories
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bean_id    :integer
#  product_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_histories_on_bean_id     (bean_id)
#  index_histories_on_product_id  (product_id)
#  index_histories_on_user_id     (user_id)
#
FactoryBot.define do
  factory :history do
    user

    trait :product_history do
      product
    end

    trait :bean_history do
      bean
    end
  end
end
