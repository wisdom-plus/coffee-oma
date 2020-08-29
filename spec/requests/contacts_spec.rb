require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  let(:contact) { create(:contact) }
  let(:contact_params) { attributes_for(:contact) }

  describe 'GET /new' do
    it 'returns http success' do
      get new_contact_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post contacts_path, params: { contact: contact_params }
      expect(response).to have_http_status(:found)
    end

    it 'created contact' do
      expect do
        post contacts_path, params: { contact: contact_params }
      end.to change(Contact, :count).by 1
    end
  end
end
