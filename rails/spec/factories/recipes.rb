# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  amount      :integer          not null
#  grinding    :integer          default(0), not null
#  powdergram  :integer          not null
#  temperature :integer          not null
#  time        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :recipe do
    user
    amount { 220 }
    grinding { '細かい' }
    powdergram { 18 }
    temperature { 92 }
    time { 180 }
    status { false }
  end
end
