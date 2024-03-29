# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageNotification, type: :component do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:room) { create(:room, participant1: user, participant2: user1) }
  let(:message) { create(:message, user: user, room: room) }
  let(:notification) { create(:notification, source: message, user: user) }

  it 'renders a follow notification' do
    render_inline(MessageNotification::Component.new(notifications: [notification]))

    expect(page).to have_text notification.sender.username
  end

  it 'renders a follow notification(nil)' do
    render_inline(MessageNotification::Component.new(notifications: []))

    expect(page).to have_text '通知はまだ届いていません'
  end
end
