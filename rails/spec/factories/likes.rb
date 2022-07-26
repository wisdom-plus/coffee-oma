# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  liked_id   :bigint
#  user_id    :integer
#
# Indexes
#
#  index_likes_on_created_at  (created_at)
#  index_likes_on_user_id     (user_id)
#
FactoryBot.define do
  factory :like do
    user

    factory :product_like do
      liked { product }
    end

    factory :bean_like do
      liked { bean }
    end

    factory :product_review_like do
      liked { review }
    end

    factory :bean_review_like do
      liked { bean_review }
    end
  end
end
