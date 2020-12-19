# == Schema Information
#
# Table name: reviews
#
#  id                :bigint           not null, primary key
#  acidity           :integer          default(0)
#  bitter            :integer          default(0)
#  content           :text(65535)      not null
#  flavor            :integer          default(0)
#  rate              :float(24)
#  reviewlikes_count :integer          default(0), not null
#  rich              :integer          default(0)
#  sweet             :integer          default(0)
#  title             :string(255)      not null
#  type              :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  bean_id           :bigint
#  product_id        :bigint
#  user_id           :bigint
#
# Indexes
#
#  index_reviews_on_bean_id     (bean_id)
#  index_reviews_on_product_id  (product_id)
#  index_reviews_on_user_id     (user_id)
#
class BeanReview < Review
end
