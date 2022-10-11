# == Schema Information
#
# Table name: image_attachments
#
#  id             :bigint           not null, primary key
#  attachment     :string(255)
#  imageable_type :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :bigint           not null
#
# Indexes
#
#  index_image_attachments_on_imageable  (imageable_type,imageable_id)
#
FactoryBot.define do
  factory :image_attachment do
    attachment { Rack::Test::UploadedFile.new('spec/support/noimage.png', 'image/png') }
  end
end
