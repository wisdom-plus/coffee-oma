require 'rails_helper'

RSpec.describe "Rooms", type: :system do
  let(:user) { create(:user)}
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test2') }
  let(:room) { create(:room, participant1: user, participant2: user1)}
  let(:message) { create(:message, user: user, room: room)}
  let(:message1) { create(:message, user: user1, room: room, message: "これはuser1のメッセージです")}
  let(:message_params) { attributes_for(:message, user_id: user.id, room_id: room.id)}

  describe "index" do
    before do
      login(user, user.email, user.password)
      user1
      room
      message
      visit rooms_path
    end

    it "render page" do
      expect(page).to have_content "メッセージ一覧"
      expect(page).to have_content "#{user1.username}"
      expect(page).to have_content "#{message.message}"
    end
  end

  describe "show" do
    before do
      login(user, user.email, user.password)
      room
      message
      message1
      visit room_path(room.id)
    end

    it "render page" do
      expect(page).to have_content "#{user1.username}"
      expect(page).to have_content "#{message.message}"
      expect(page).to have_content "#{message1.message}"
      expect(page).to have_css ".balloon_r"
      expect(page).to have_css ".balloon_l"
    end

  end

  describe "create" do
    before do
      login(user, user.email, user.password)
      user1
    end

    it "create room" do
      visit "users/#{user1.id}/show"
      click_on "メッセージを送る"
      expect(current_path).to eq room_path(Room.first.id)
      expect(page).to have_content "#{user1.username}"
    end
  end
end
