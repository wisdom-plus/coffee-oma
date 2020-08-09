# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  content    :text(65535)      not null
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
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :title, presence: true
  validates :content, presence: true
end
