require 'rails_helper'

RSpec.describe "Beans", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/beans/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/beans/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/beans/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/beans/index"
      expect(response).to have_http_status(:success)
    end
  end

end
