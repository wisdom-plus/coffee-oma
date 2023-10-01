# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikeNotification, type: :component do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user1, product: product) }
  let(:like) { create(:product_review_like, user: user, liked_id: review.id) }
  let(:notification) { create(:notification, source: like, user: user) }

  it 'renders a follow notification' do
    render_inline(LikeNotification::Component.new(notifications: [notification]))

    expect(page).to have_text notification.sender.username
  end

  it 'renders a follow notification(nil)' do
    render_inline(LikeNotification::Component.new(notifications: []))

    expect(page).to have_text '通知はまだ届いていません'
  end
end
