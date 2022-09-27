# == Schema Information
#
# Table name: selfs
#
#  id            :bigint           not null, primary key
#  caption       :text(65535)
#  image         :text(65535)
#  likes_count   :integer          default(0), not null
#  name          :string(255)
#  price         :integer
#  rate_sum      :integer          default(0), not null
#  reviews_count :integer          default(0), not null
#  shopname      :string(255)
#  url           :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_selfs_on_likes_count  (likes_count)
#  index_selfs_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :self_likes,
           foreign_key: 'liked_id',
           dependent: :destroy,
           inverse_of: :self
  belongs_to :user

  mount_uploader :image, ImageurlUploader
  acts_as_taggable

  validates :name, :price, :shopname, :caption, presence: true

  scope :keywords_search, ->(keywords) { ransack(keywords) }
  scope :sort_by_likes_count, -> { order('likes_count desc') }

  def rate_average_num
    if reviews_count.zero?
      return 0
    end

    (rate_average * 2).floor / 2.to_f
  end

  def rate_average
    if reviews_count.zero?
      return 0
    end

    (rate_sum.to_f / reviews_count).floor(1)
  end

  def self.like_top
    self.all.sort_by_likes_count.limit(TOP_DISPALY_NUM)
  end

  def self.tag_result(tag_name, page)
    self.tagged_with(tag_name).page(page).per(INDEX_DISPALY_NUM)
  end

  def self.ranking_index
    self.all.sort_by_likes_count.limit(INDEX_DISPALY_NUM)
  end
end
