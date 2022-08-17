require 'rails_helper'

RSpec.describe 'Rooms', type: :system do
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test2@example.com', username: 'test2') }
  let(:user2) { create(:user, email: 'test3@example.com', username: 'test3') }
  let(:follow) { create(:relationship, user: user, follow: user1) }
  let(:room) { create(:room, participant1: user, participant2: user1) }
  let(:room1) { create(:room, participant1: user1, participant2: user2) }
  let(:message) { create(:message, user: user, room: room) }
  let(:message1) { create(:message, user: user1, room: room, message: 'これはuser1のメッセージです') }
  let(:message_params) { attributes_for(:message, user_id: user.id, room_id: room.id) }

  context 'when login' do
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

      it 'render new button' do
        visit rooms_path
        click_on 'メッセージを送る'
        expect(page).to have_current_path new_room_path
      end
    end

    context 'new' do
      it 'render page' do
        follow
        visit new_room_path
        expect(page).to have_content user1.username
      end

      it 'created room(room not exists)' do
        follow
        visit new_room_path
        expect do
          click_on user1.username
        end.to change(Room, :count).by 1
        expect(page).to have_current_path room_path(Room.last.id)
      end

      it 'created room(room exists)' do
        follow
        room
        visit new_room_path
        expect do
          click_on user1.username
        end.not_to change(Room, :count)
        expect(page).to have_current_path room_path(room.id)
      end

      it 'render page(no following)' do
        visit new_room_path
        expect(page).to have_content 'フォローしているユーザーがいません'
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

      it 'not included room' do
        visit room_path(room1.id)
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end

    context 'create' do
      it 'created room' do
        visit "users/#{user1.id}/show"
        click_on 'メッセージを送る'
        expect(page).to have_current_path room_path(Room.first.id), ignore_query: true
        expect(page).to have_content user1.username.to_s
      end
    end
  end

  context 'when not login' do
    it 'not displayed message-label' do
      visit "users/#{user1.id}/show"
      expect(page).to have_no_css '.spec-message'
    end

    it 'redirect sign_in page(index)' do
      room
      visit rooms_path
      expect(page).to have_current_path new_user_session_path, ignore_query: true
    end

    it 'redirect sign_in page(show)' do
      room
      visit room_path(room.id)
      expect(page).to have_current_path new_user_session_path, ignore_query: true
    end
  end
end
