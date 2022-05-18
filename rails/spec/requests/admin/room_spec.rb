require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1)  { create(:user, email: 'test1@example.com', username: 'test2') }

  describe 'Room' do
    before do
      user
      user1
      sign_in admin
    end

    it 'created resource' do
      expect do
        post admin_rooms_path, params: { room: attributes_for(:room, participant1_id: user.id, participant2_id: user1.id) }
      end.to change(Room, :count).by 1
    end
  end
end
