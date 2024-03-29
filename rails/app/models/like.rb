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
class Like < ApplicationRecord
  belongs_to :user
  has_many :notifications, as: :source, dependent: :destroy

  validates :liked_id, presence: true

  scope :find_product_and_bean, ->(user_id) { where(["user_id = ? and type IN ('ProductLike','BeanLike')", user_id]).order(created_at: :DESC) }

  # :nocov:
  def self.product_and_bean_likes_includes(_likes)
    ActiveRecord::Associations::Preloader.new(records: self, associations: %i[bean_like product_like])
  end

  def self.like_includes(user_id)
    likes = find_product_and_bean(user_id)
    product_and_bean_likes_includes(likes)
    likes
  end
  # :nocov:
end
