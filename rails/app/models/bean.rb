# == Schema Information
#
# Table name: beans
#
#  id           :bigint           not null, primary key
#  area         :string(255)
#  country      :string(255)
#  description  :text(65535)
#  name         :string(255)
#  purification :string(255)
#  roast        :integer          default(0), not null
#  url          :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Bean < ApplicationRecord
  enum roast: [ "焙煎度不明", "生豆","ミディアム","ハイ","シティ","フルシティ","フレンチ","イタリアン"]

  validates :name, :country, :roast, presence: true

end
