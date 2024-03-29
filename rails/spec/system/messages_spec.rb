require 'rails_helper'

RSpec.describe 'Messages', :js do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:room) { create(:room, participant1: user, participant2: user1) }
  let(:message) { create(:message, user: user, room: room) }

  describe 'create' do
    before do
      login(user, user.email, user.password)
      visit room_path(room.id)
    end

    it 'create message' do
      fill_in 'message[message]', with: message.message
      click_on '送信'
      expect(page).to have_content message.message
      expect(page).to have_css '.balloon_r'
    end

    it 'not create message' do
      fill_in 'message[message]', with: ''
      click_on '送信'
      expect(page).to have_no_css '.balloon_r'
    end
  end
end
