require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }

  describe 'Contact' do
    before do
      sign_in admin
    end

    it 'created resource' do
      expect do
        post admin_contacts_path, params: { contact: attributes_for(:contact) }
      end.to change(Contact, :count).by 1
    end
  end
end
