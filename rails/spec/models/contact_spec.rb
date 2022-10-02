require 'rails_helper'

RSpec.describe Contact, type: :model do
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
