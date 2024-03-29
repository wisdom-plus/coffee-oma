# == Schema Information
#
# Table name: brands
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  logo        :string(255)
#  name        :string(255)      not null
#  website     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Brand < ApplicationRecord
  has_many :products, dependent: :destroy

  mount_uploader :logo, LogoUploader

  validates :name, :description, :website, presence: true
end
