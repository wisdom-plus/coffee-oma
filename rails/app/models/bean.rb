# == Schema Information
#
# Table name: beans
#
#  id           :bigint           not null, primary key
#  area         :string(255)
#  country      :string(255)      not null
#  description  :text(65535)
#  image        :string(255)
#  likes_count  :integer          default(0), not null
#  name         :string(255)      not null
#  purification :integer          default("不明"), not null
#  review_count :integer          default(0), not null
#  roast        :integer          default("焙煎度不明"), not null
#  url          :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
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
  mount_uploader :image, ImageurlUploader
  acts_as_taggable

  belongs_to :user
  has_many :histories, dependent: :destroy
  has_many :bean_reviews, dependent: :destroy
  has_many :bean_likes,
           foreign_key: 'liked_id',
           dependent: :destroy,
           inverse_of: :bean

  scope :keywords_search, ->(keywords) { ransack(keywords) }

  def evaluations
    %w[acidity bitter sweet rich flavor].map do |e|
      bean_reviews.average(e).to_s
    end
  end

  def self.tag_result(tag_name, page)
    Bean.tagged_with(tag_name).page(page).per(INDEX_DISPALY_NUM)
  end
end
