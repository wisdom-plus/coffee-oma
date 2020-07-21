require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "GET /registrations" do
    it "works! (now write some real specs)" do
      get registrations_index_path
      expect(response).to have_http_status(200)
    end
  end
end
