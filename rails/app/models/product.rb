# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  caption       :text(65535)
#  likes_count   :integer          default(0), not null
#  name          :string(255)
#  price         :integer
#  rate_sum      :integer          default(0), not null
#  reviews_count :integer          default(0), not null
#  shopname      :string(255)
#  url           :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  brand_id      :bigint
#  user_id       :bigint           not null
#
# Indexes
#
#  index_products_on_brand_id     (brand_id)
#  index_products_on_likes_count  (likes_count)
#  index_products_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_one :brand, optional: true, dependent: :destroy
  has_many :product_likes,
           foreign_key: 'liked_id',
           dependent: :destroy,
           inverse_of: :product
  has_one :thread_image, as: :imageable, dependent: :destroy
  belongs_to :user

  acts_as_taggable

  validates :name, :price, :shopname, :caption, presence: true

  before_save :default_image

  scope :keywords_search, ->(keywords) { ransack(keywords) }
  scope :sort_by_likes_count, -> { order('likes_count desc') }
  scope :page_offset, ->(page) { offset(page * INDEX_DISPALY_NUM) }

  delegate :images, to: :thread_image, allow_nil: true

  def initialize(*args)
    super(*args)
    self.images = nil
  end

  def self.like_top
    all.sort_by_likes_count.limit(TOP_DISPALY_NUM)
  end

  def self.tag_result(tag_name, page)
    tagged_with(tag_name).page(page).per(INDEX_DISPALY_NUM)
  end

  def self.ranking_index
    all.sort_by_likes_count.limit(INDEX_DISPALY_NUM)
  end

  def images=(file)
    if thread_image
      thread_image.attachments = file
    else
      build_thread_image(attachments: file)
    end
  end

  def api_json
    {
      id: id,
      name: name,
      url: url,
      shopname: shopname,
      price: price,
      caption: caption,
      reviews_count: reviews_count,
      image: { url: images[0].url }
      # rate_average: rate_average
    }
  end

  def self.index_pagenation(page)
    limit(INDEX_DISPALY_NUM).offset(page * INDEX_DISPALY_NUM)
  end

  private

    def default_image
      return unless images == []

      self.images = [File.open('public/noimage.jpg')]
    end
end
