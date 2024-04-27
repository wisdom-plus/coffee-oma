require 'rails_helper'

RSpec.describe NotificationDecorator do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user1, product: product) }
  let(:like) { create(:product_review_like, user: user, liked_id: review.id) }
  let(:notification) { create(:notification, source: like, user: user).decorate }

  it do
    expect(notification.class_name).to eq notification.source.class.name
  end
end
