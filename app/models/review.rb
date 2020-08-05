# == Schema Information
#
# Table name: reviews
#
#  id            :bigint           not null, primary key
#  content       :text(65535)
#  title         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  product_id_id :bigint
#  user_id_id    :bigint
#
# Indexes
#
#  index_reviews_on_product_id_id  (product_id_id)
#  index_reviews_on_user_id_id     (user_id_id)
#
class Review < ApplicationRecord
  belongs_to :user
  belogns_to :product
end
