# == Schema Information
#
# Table name: beans
#
#  id           :bigint           not null, primary key
#  area         :string(255)
#  country      :string(255)      not null
#  description  :text(65535)
#  image        :string(255)
#  likes_count  :integer          default(0), not null
#  name         :string(255)      not null
#  purification :integer          default("不明"), not null
#  review_count :integer          default(0), not null
#  roast        :integer          default("焙煎度不明"), not null
#  url          :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_beans_on_user_id  (user_id)
#
FactoryBot.define do
  factory :bean do
    user
    area { 'サンパウロ' }
    country { 'ブラジル' }
    description { 'これはテストです' }
    name { 'コーヒー豆の名前' }
    purification { 'ナチェラル' }
    roast { 'シティ' }
    url { 'https://example.com' }
    tag_list { 'コーヒー豆' }
  end
end
