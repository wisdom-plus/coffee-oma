# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  catchcopy   :string(255)
#  imageurl    :text(65535)
#  itemcaption :text(65535)
#  itemname    :string(255)
#  itemprice   :integer
#  itemurl     :text(65535)
#  shopname    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
