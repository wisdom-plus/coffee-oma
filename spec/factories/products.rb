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
FactoryBot.define do
  factory :product do
    itemname { 'コーヒーの器具の名前' }
    itemprice { 1000 }
    shopname { 'コーヒーのお店' }
    itemurl { 'https://example.com' }
    itemcaption { 'itemの説明文が入ります' }
    catchcopy { 'itemのキャッチコピーが入ります' }
    imageurl { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/noimage.jpg')) }
  end
end
