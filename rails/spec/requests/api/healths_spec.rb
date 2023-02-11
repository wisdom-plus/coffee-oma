require 'rails_helper'

RSpec.describe 'Healths' do
  describe 'GET /api/v1/healths' do
    it 'レスポンス成功' do
      get api_v1_healths_path
      expect(response).to have_http_status(:success)
    end
  end
end
