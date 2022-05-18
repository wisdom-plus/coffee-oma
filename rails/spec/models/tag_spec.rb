require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'scope' do
    it 'tag_search' do
      tag = create(:tag, name: 'tag1')
      expect(Tag.tag_search('tag')).to include(tag)
    end

    it 'tag_search(nil)' do
      tag = create(:tag, name: 'tag1')
      tag2 = create(:tag, name: 'tag2')
      expect(Tag.tag_search(nil)).to include(tag, tag2)
    end
  end
end
