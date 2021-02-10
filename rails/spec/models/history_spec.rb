# == Schema Information
#
# Table name: histories
#
#  id              :bigint           not null, primary key
#  controller_type :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  show_id         :bigint           not null
#  user_id         :bigint
#
# Indexes
#
#  index_histories_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe History, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
