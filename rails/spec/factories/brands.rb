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
FactoryBot.define do
  factory :brand do
    name { 'Coffee Brand' }
    website { 'https://www.coffeebrand.com' }
    description { 'This is a coffee brand' }
    logo { Rack::Test::UploadedFile.new('spec/support/noimage.png', 'image/png') }
  end
end
