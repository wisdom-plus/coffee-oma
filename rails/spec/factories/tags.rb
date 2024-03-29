# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  taggings_count :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :tag do
    name { 'coffee' }
  end
end
