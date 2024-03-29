require 'rails_helper'

RSpec.describe 'Relationships' do
  let_it_be(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:follow) { create(:relationship, user: user, follow: user1) }

  describe 'POST create' do
    before do
      user.confirm
      sign_in user
    end

    it 'request success' do
      post relationships_path, params: { follow_id: user1.id }, xhr: true
      expect(response).to have_http_status(:see_other)
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
      user.confirm
      sign_in user
    end

    it 'request success' do
      delete relationship_path(follow.id), params: { follow_id: follow.follow_id }, xhr: true
      expect(response).to have_http_status(:see_other)
    end

    it 'destroy relationship' do
      expect do
        delete relationship_path(follow.id), params: { follow_id: follow.follow_id }, xhr: true
      end.to change(Relationship, :count).by(-1)
    end
  end
end
