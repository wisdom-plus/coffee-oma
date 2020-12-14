# == Schema Information
#
# Table name: beans
#
#  id           :bigint           not null, primary key
#  area         :string(255)
#  country      :string(255)
#  description  :text(65535)
#  name         :string(255)
#  purification :string(255)
#  roast        :integer          default(0), not null
#  url          :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Bean, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
