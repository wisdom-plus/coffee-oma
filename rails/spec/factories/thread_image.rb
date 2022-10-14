# == Schema Information
#
# Table name: thread_images
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
#  index_thread_images_on_imageable  (imageable_type,imageable_id)
#
FactoryBot.define do
  factory :thread_image do
    attachment { Rack::Test::UploadedFile.new('spec/support/noimage.png', 'image/png') }
  end
end
