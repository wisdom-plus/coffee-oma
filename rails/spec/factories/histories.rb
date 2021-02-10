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
FactoryBot.define do
  factory :history do
    
  end
end
