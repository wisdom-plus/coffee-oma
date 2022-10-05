require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }

  describe 'Relationship' do
    it 'created resource' do
      user
      user1
      sign_in admin
      expect do
        post admin_relationships_path, params: { relationship: attributes_for(:relationship, user_id: user.id, follow_id: user1.id) }
      end.to change(Relationship, :count).by 1
    end
  end
end
