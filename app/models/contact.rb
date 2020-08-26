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
class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :content, presence: true


end
