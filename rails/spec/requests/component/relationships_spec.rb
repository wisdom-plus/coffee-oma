require 'rails_helper'

RSpec.describe 'Component::Relationships' do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:follow) { create(:relationship, user: user, follow: user1) }
  let(:follow1) { create(:relationship, user: user1, follow: user) }

  describe 'GET /followings_user_show' do
    it 'request success' do
      follow
      get followings_user_show_component_relationships_path(user_id: user.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /followers_user_show' do
    it 'request success' do
      follow1
      get followers_user_show_component_relationships_path(user_id: user1.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
