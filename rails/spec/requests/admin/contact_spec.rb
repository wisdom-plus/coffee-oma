require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }

  describe 'Contact' do
    it 'created resource' do
      sign_in admin
      expect do
        post admin_contacts_path, params: { contact: attributes_for(:contact) }
      end.to change(Contact, :count).by 1
    end
  end
end
