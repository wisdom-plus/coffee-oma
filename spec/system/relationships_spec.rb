require 'rails_helper'

RSpec.describe "Relationships", type: :system do
let(:user) { create(:user)}
let(:user1) { create(:user, username: "test2",email: "test1@example.com")}
let(:follow) { create(:relationship,user: user, follow: user1)}

describe 'follow' do
  before do
    login(user, user.email, user.password)
  end

  describe 'create' do
    it 'create relationship' do
      visit "/users/#{user1.id}/show"
      click_link "フォローする"
      visit "/users/#{user1.id}/show"
      expect(page).to have_link 'フォロー解除'
    end

    it 'not render link' do
      visit "/users/#{user.id}/show"
      expect(page).to have_no_link 'フォローする'
    end
  end

  describe 'destroy' do
    before do
      follow
    end

    it 'destroy relationship' do
      visit "/users/#{user1.id}/show"
      click_link "フォロー解除"
      visit "/users/#{user1.id}/show"
      expect(page).to have_link "フォローする"
    end

    it 'not render link' do
      visit "/users/#{user.id}/show"
      expect(page).to have_no_link 'フォロー解除'
    end
  end
end
end
