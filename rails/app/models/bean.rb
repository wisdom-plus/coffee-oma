# == Schema Information
#
# Table name: beans
#
#  id            :bigint           not null, primary key
#  area          :string(255)
#  country       :string(255)      not null
#  description   :text(65535)
#  likes_count   :integer          default(0), not null
#  name          :string(255)      not null
#  purification  :integer          default("不明"), not null
#  reviews_count :integer          default(0), not null
#  roast         :integer          default("焙煎度不明"), not null
#  url           :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint
#
# Indexes
#
#  index_beans_on_likes_count  (likes_count)
#  index_beans_on_user_id      (user_id)
#
class Bean < ApplicationRecord
  enum roast: { 焙煎度不明: 0,
                生豆: 1,
                ミディアム: 2,
                ハイ: 3,
                シティ: 4,
                フルシティ: 5,
                フレンチ: 6,
                イタリアン: 7 }
  enum purification: { 不明: 0, ナチェラル: 1, ウォッシュド: 2, ハニー: 3, スマトラ式: 4 }
  validates :name, :country, :roast, presence: true
  acts_as_taggable

  belongs_to :user
  has_many :histories, dependent: :destroy
  has_many :bean_reviews, dependent: :destroy
  has_many :bean_likes,
           foreign_key: 'liked_id',
           dependent: :destroy,
           inverse_of: :bean
  has_one :thread_image, as: :imageable, dependent: :destroy

  before_save :default_image

  delegate :images, to: :thread_image, allow_nil: true

  scope :keywords_search, ->(keywords) { ransack(keywords) }

  def initialize(*args)
    super(*args)
    self.images = nil
  end

  def self.tag_result(tag_name, page)
    Bean.tagged_with(tag_name).page(page).per(INDEX_DISPALY_NUM)
  end

  def images=(file)
    if thread_image
      thread_image.attachments = file
    else
      build_thread_image(attachments: file)
    end
  end

  private

    def default_image
      return unless images == []

      self.images = [File.open('public/noimage.jpg')]
    end
end
