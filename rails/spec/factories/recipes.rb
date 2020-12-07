# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  amount      :integer          not null
#  grinding    :string(255)      not null
#  powdergram  :integer          not null
#  temperature :integer          not null
#  time        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :recipe do
    
  end
end
