# == Schema Information
#
# Table name: notifications
#
#  id          :bigint           not null, primary key
#  checked     :boolean          default(FALSE), not null
#  source_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  source_id   :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_notifications_on_checked     (checked)
#  index_notifications_on_created_at  (created_at)
#  index_notifications_on_source      (source_type,source_id)
#  index_notifications_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Notification do
  let(:user) { create(:user) }
  let(:other_user) { create(:user, :other_user) }
  let(:follow) { create(:relationship, user: other_user, follow: user) }
  let(:notification) { create(:notification, user: user, source: follow) }

  it 'get unckecked' do
    notification
    expect(Notification.checked_false).to include(notification)
  end

  it 'is sender for source user' do
    notification
    expect(notification.sender).to eq other_user
  end

  it 'is update checked' do
    notification
    Notification.checked_notifications(user.id)
    expect(notification.reload.checked).to be true
  end
end
