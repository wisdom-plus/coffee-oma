require 'rails_helper'

RSpec.describe "News", type: :request do
  let(:news) { create(:news)}

  describe "GET /news" do
    it 'request success' do
      get news_index_path
      expect(response).to have_http_status(:ok)
    end

  end

  describe "POST /news" do

  end

  describe "GET /news/new" do
    it 'request success' do
      get new_news_path
      expect(response).to have_http_status(:ok)
    end
  end
  describe "GET /news/:id/edit" do

  end
  describe "GET /news/:id" do
    it "request success" do
      get news_path(news.id)
      expect(response).to have_http_status(:ok)
    end

  end
  describe "PUT /news/:id" do

  end
  describe "DELETE /news/:id" do

  end
end
