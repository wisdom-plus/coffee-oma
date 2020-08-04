# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id_id :bigint
#
# Indexes
#
#  index_reviews_on_user_id_id  (user_id_id)
#
FactoryBot.define do
  factory :review do
    
  end
end
