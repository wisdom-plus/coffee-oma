require 'rails_helper'

RSpec.describe 'Admin relationship' do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let!(:follow) { create(:relationship, user: user, follow: user1) }

  describe 'relationship' do
    before do
      admin_login(admin)
      visit admin_relationships_path
    end

    it 'displayed index' do
      expect(page).to have_content 'フォロー'
    end

    it 'displayed show' do
      visit admin_relationship_path(follow.id)
      expect(page).to have_content user1.username
      expect(page).to have_content user.username
    end

    it 'delete resource' do
      expect do
        visit admin_relationship_path(follow.id)
        click_on 'フォロー を削除する'
      end.to change(Relationship, :count).by(-1)
    end
  end
end
