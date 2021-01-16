# == Schema Information
# Schema version: 20201228080513
#
# Table name: beans
#
#  id           :bigint           not null, primary key
#  area         :string(255)
#  country      :string(255)      not null
#  description  :text(65535)
#  image        :string(255)
#  name         :string(255)      not null
#  purification :integer          default("不明"), not null
#  roast        :integer          default("焙煎度不明"), not null
#  url          :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_beans_on_user_id  (user_id)
#
class Bean < ApplicationRecord
  enum roast: { "\u7119\u714E\u5EA6\u4E0D\u660E" => 0,
                "\u751F\u8C46" => 1,
                "\u30DF\u30C7\u30A3\u30A2\u30E0" => 2,
                "\u30CF\u30A4" => 3,
                "\u30B7\u30C6\u30A3" => 4,
                "\u30D5\u30EB\u30B7\u30C6\u30A3" => 5,
                "\u30D5\u30EC\u30F3\u30C1" => 6,
                "\u30A4\u30BF\u30EA\u30A2\u30F3" => 7 }
  enum purification: { 不明: 0, ナチェラル: 1, ウォッシュド: 2, ハニー: 3, スマトラ式: 4 }

  validates :name, :country, :roast, presence: true
  mount_uploader :image, ImageurlUploader

  belongs_to :user
  has_many :bean_reviews, dependent: :destroy

  def evaluations
    %w[acidity bitter sweet rich flavor].map do |e|
      bean_reviews.average(e).to_s
    end
  end
end