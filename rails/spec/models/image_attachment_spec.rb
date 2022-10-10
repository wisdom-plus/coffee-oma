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
require 'rails_helper'

RSpec.describe ImageAttachment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
