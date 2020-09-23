require 'rails_helper'

RSpec.describe "Notifications", type: :system do
  let(:user) { create(:user)}
  let(:user1) { create(:user, email: 'test2@example.com', username: 'test2') }
  let(:notification) { create(:notification, visitor: user, visited: user1, action: "follow", checked: false)}

  describe 'index' do
    before do
      login(user, user.email, user.password)
      notification
      visit notifications_path
    end

    it 'render page' do
      expect(page).to have_coonte "#{user1.username}さんにフォローされました"
    end
  end
end
