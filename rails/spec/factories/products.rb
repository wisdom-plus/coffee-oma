# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  imageurl      :text(65535)
#  itemcaption   :text(65535)
#  itemname      :string(255)
#  itemprice     :integer
#  itemurl       :text(65535)
#  likes_count   :integer          default(0), not null
#  rate_sum      :integer          default(0), not null
#  reviews_count :integer          default(0), not null
#  shopname      :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_products_on_likes_count  (likes_count)
#  index_products_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :product do
    itemname { 'コーヒーの器具の名前' }
    itemprice { 1000 }
    shopname { 'コーヒーのお店' }
    itemurl { 'https://example.com' }
    itemcaption { 'itemの説明文が入ります' }
    imageurl { Rack::Test::UploadedFile.new('spec/support/noimage.png','image/png') }
    tag_list { 'コーヒー' }
    user
  end
end
