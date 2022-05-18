require 'rails_helper'

RSpec.describe 'Api', type: :request do
  let(:user) { create(:user) }

  describe 'Tag' do
    it 'request success(keyword present)' do
      get api_v1_tags_path, params: { keyword: 'test' }
      expect(response).to have_http_status(:success)
    end

    it 'request success(keyword nil)' do
      get api_v1_tags_path
      expect(response).to have_http_status(:success)
    end
  end
end
