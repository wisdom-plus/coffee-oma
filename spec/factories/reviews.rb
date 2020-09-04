# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  content    :text(65535)      not null
#  rate       :float(24)
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_reviews_on_product_id  (product_id)
#  index_reviews_on_user_id     (user_id)
#
FactoryBot.define do
  factory :review do
    content { 'コーヒー器具に関するレビューの本文' }
    title { 'レビューのタイトル' }
    rate {1}
    user
    product
  end
end
