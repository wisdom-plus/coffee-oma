require 'rails_helper'

RSpec.describe "Messages", type: :system do
  let(:user) { create(:user)}
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test2') }
  let(:room) { create(:room, participant1: user, participant2: user1)}
  let(:message) { create(:message, user: user, room: room)}
  let(:message_params) { attributes_for(:message, user_id: user.id, room_id: room.id)}

    describe 'create' do
      before do
        login(user, user.email, user.password)
        visit room_path(room.id)
      end

      it 'create message' do
        fill_in 'message[message]', with: "これはメッセージのテストです"
        click_on "送信"
        expect(page).to have_content "これはメッセージのテストです"
        expect(page).to have_css ".balloon_r"
      end

      it 'not create message' do
        fill_in "message[message]", with: ""
        click_on "送信"
        expect(page).to have_no_css ".balloon_r"
      end
    end
end
