require 'rails_helper'

RSpec.describe 'Relationships', type: :request do
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test2') }
  let(:follow) { create(:relationship, user: user, follow: user1) }

  before do
    user.confirm
    sign_in user
  end

  describe 'POST create' do
    it 'request success' do
      post relationships_path, params: { follow_id: user1.id }, xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'created relationship' do
      expect do
        post relationships_path, params: { follow_id: user1.id }, xhr: true
      end.to change(Relationship, :count).by 1
    end
  end

  describe 'DELETE destroy' do
    before do
      follow
    end

    it 'request success' do
      delete relationship_path(follow.id), params: { id: follow.id }, xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'destroy relationship' do
      expect do
        delete relationship_path(follow.id), params: { id: follow.id }, xhr: true
      end.to change(Relationship, :count).by(-1)
    end
  end
end
