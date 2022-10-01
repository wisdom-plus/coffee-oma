require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:user) { create(:user) }
  let(:other_user) { create(:user, :other_user) }
  let(:follow) { create(:relationship, user: other_user,follow: user)}
  let(:notification) { create(:notification, user: user, source: follow) }

  it "get unckecked" do
    notification
    expect(Notification.checked_false).to include(notification)
  end

  it "is sender for source user" do
    notification
    expect(notification.sender).to eq other_user
  end

  it "is update checked" do
    notification
    Notification.checked_notifications(user.id)
    expect(notification.reload.checked).to eq true
  end
end
