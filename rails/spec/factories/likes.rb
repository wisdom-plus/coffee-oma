# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  liked_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_likes_on_created_at  (created_at)
#  index_likes_on_user_id     (user_id)
#
FactoryBot.define do
  factory :like do
    user
  end

  factory :product_like, class: 'ProductLike' do
    type { 'ProductLike' }
  end

  factory :bean_like, class: 'BeanLike' do
    type { 'BeanLike' }
  end

  factory :product_review_like, class: 'ProductReviewLike' do
    type { 'ProductReviewLike' }
  end

  factory :bean_review_like, class: 'BeanReviewLike' do
    type { 'BeanReviewLike' }
  end
end
