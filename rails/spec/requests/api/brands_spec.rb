require 'rails_helper'

RSpec.describe 'API::Brands' do
  let(:brand) { create(:brand) }

  describe 'GET /api/brands' do
    it 'return all brands' do
      brand
      get api_v1_brands_path
      expect(response).to have_http_status(:ok)
    end
  end
end
