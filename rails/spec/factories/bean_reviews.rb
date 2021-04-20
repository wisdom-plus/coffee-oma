# == Schema Information
#
# Table name: bean_reviews
#
#  id                :bigint           not null, primary key
#  acidity           :integer
#  bitter            :integer
#  content           :text(65535)      not null
#  flavor            :integer
#  reviewlikes_count :integer          default(0), not null
#  rich              :integer
#  sweet             :integer
#  title             :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  bean_id           :bigint
#  user_id           :bigint
#
# Indexes
#
#  index_bean_reviews_on_bean_id  (bean_id)
#  index_bean_reviews_on_user_id  (user_id)
#
FactoryBot.define do
  factory :bean_review do
    user
    bean
    bitter { 1 }
    acidity { 2 }
    flavor { 3 }
    sweet { 4 }
    rich { 5 }
    title { 'タイトル' }
    content { 'コーヒー豆のレビュー内容' }
  end
end
