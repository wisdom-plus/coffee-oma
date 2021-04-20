# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  imageurl      :text(65535)
#  itemcaption   :text(65535)
#  itemname      :string(255)
#  itemprice     :integer
#  itemurl       :text(65535)
#  likes_count   :integer          default(0), not null
#  reviews_count :integer          default(0), not null
#  shopname      :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :product_likes,
           foreign_key: 'liked_id',
           dependent: :destroy,
           inverse_of: :product

  mount_uploader :imageurl, ImageurlUploader
  acts_as_taggable

  validates :itemname, :itemprice, :shopname, :itemcaption, presence: true


  def rate_average
    (reviews.average(:rate) * 2).floor / 2.to_f
  end
end
