# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FollowNotification, type: :component do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:follow) { create(:relationship, user: user, follow: user) }
  let(:notification) { create(:notification, source: follow, user: user) }

  it 'renders a follow notification' do
    render_inline(described_class.new(notifications: [notification]))

    expect(page).to have_text notification.sender.username
  end

  it 'renders a follow notification(nil)' do
    render_inline(described_class.new(notifications: []))

    expect(page).to have_text '通知はまだ届いていません'
  end
end
