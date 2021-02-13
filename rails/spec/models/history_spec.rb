# == Schema Information
#
# Table name: histories
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bean_id    :bigint
#  product_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_histories_on_bean_id     (bean_id)
#  index_histories_on_product_id  (product_id)
#  index_histories_on_user_id     (user_id)
#
require 'rails_helper'

RSpec.describe History, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
