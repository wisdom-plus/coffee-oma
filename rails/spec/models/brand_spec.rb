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
require 'rails_helper'

RSpec.describe Brand, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
