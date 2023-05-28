# == Schema Information
#
# Table name: brands
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  logo        :string(255)
#  name        :string(255)      not null
#  website     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Brand < ApplicationRecord
  belongs_to :product

  mount_uploader :logo, LogoUploader

  scope :serach, ->(keyword) do
    return if keyword.nil?

    where('name LIKE ?', "#{keyword}%")
  end
end
