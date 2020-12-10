# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  amount      :integer          not null
#  grinding    :string(255)      not null
#  powdergram  :integer          not null
#  status      :boolean          default(FALSE)
#  temperature :integer          not null
#  time        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_recipes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :recipe do
    user
    amount {220}
    grinding {'細かい'}
    powdergram {18}
    temperature {92}
    time {180}
    status {false}
  end
end
