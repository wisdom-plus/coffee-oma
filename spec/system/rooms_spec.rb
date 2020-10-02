require 'rails_helper'

RSpec.describe 'Rooms', type: :system do
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test2@example.com', username: 'test2') }
  let(:user2) { create(:user, email: 'test3@example.com', username: 'test3') }
  let(:room) { create(:room, participant1: user, participant2: user1) }
  let(:room1) { create(:room, participant1: user1, participant2: user2)}
  let(:message) { create(:message, user: user, room: room) }
  let(:message1) { create(:message, user: user1, room: room, message: 'これはuser1のメッセージです') }
  let(:message_params) { attributes_for(:message, user_id: user.id, room_id: room.id) }
  context "when login" do
    before do
      login(user, user.email, user.password)
      user1
    end

    context 'index' do
      before do
        room
        message
      end

      it 'render page' do
        visit rooms_path
        expect(page).to have_content 'メッセージ一覧'
        expect(page).to have_content user1.username.to_s
        expect(page).to have_content message.message.to_s
      end
    end

    context 'show' do
      before do
        room
        room1
        message
        message1
      end

      it 'render page' do
        visit room_path(room.id)
        expect(page).to have_content user1.username.to_s
        expect(page).to have_content message.message.to_s
        expect(page).to have_content message1.message.to_s
        expect(page).to have_css '.balloon_r'
        expect(page).to have_css '.balloon_l'
      end

      it "not included room" do
        visit room_path(room1.id)
        expect(current_path).to eq root_path
      end
    end

    context 'create' do
      it 'created room' do
        visit "users/#{user1.id}/show"
        click_on 'メッセージを送る'
        expect(current_path).to eq room_path(Room.first.id)
        expect(page).to have_content user1.username.to_s
      end
    end
  end

  context "when not login" do
    it "not displayed message-label" do
      visit "users/#{user1.id}/show"
      expect(page).to have_no_css ".spec-message"
    end

    it "redirect sign_in page(index)" do
      room
      visit rooms_path
      expect(current_path).to eq new_user_session_path
    end

    it "redirect sign_in page(show)" do
      room
      visit room_path(room.id)
      expect(current_path).to eq new_user_session_path
    end
  end
end
