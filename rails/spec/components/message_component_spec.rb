# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :component do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:room) { create(:room, participant1: user, participant2: user1) }
  let(:message) { create(:message, user: user, room: room) }

  it 'renders a component' do
    render_inline(Message::Component.new(message: message, current_user: user))

    expect(page).to have_text message.message
  end
end
