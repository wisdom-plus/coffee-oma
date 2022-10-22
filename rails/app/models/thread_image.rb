# == Schema Information
#
# Table name: thread_images
#
#  id             :bigint           not null, primary key
#  attachments    :json
#  imageable_type :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :bigint           not null
#
# Indexes
#
#  index_thread_images_on_imageable  (imageable_type,imageable_id)
#
class ThreadImage < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  mount_uploaders :attachments, ImageUploader

  def images
    attachments
  end
end
