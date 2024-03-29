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
require 'rails_helper'

RSpec.describe Contact do
  let(:build_contact) { build(:contact) }

  it 'is valid with a name' do
    build_contact.name = ''
    expect(build_contact.valid?).to be false
  end

  it 'is valid with a email' do
    build_contact.email = ''
    expect(build_contact.valid?).to be false
  end

  it 'is valid with a content' do
    build_contact.content = ''
    expect(build_contact.valid?).to be false
  end
end
