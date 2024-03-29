# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)      not null
#  email      :string(255)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :contact do
    content { 'これは問合せメールの本文が入ります' }
    email { 'test@example.com' }
    name { 'test1' }
  end
end
