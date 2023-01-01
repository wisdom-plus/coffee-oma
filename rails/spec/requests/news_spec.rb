require 'rails_helper'

RSpec.describe 'News', type: :request do
  let_it_be(:admin) { create(:admin_user) }
  let_it_be(:news) { create(:news, user: admin) }
  let(:news_params) { attributes_for(:news) }
  let(:update_news_params) { attributes_for(:news, title: 'version upのお知らせ', content: '<p>version1.1での変更点</p>') }

  describe 'GET /news' do
    it 'request success' do
      get news_index_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /news' do
    before do
      sign_in admin
    end

    it 'requests success' do
      post '/news', params: { news: news_params }
      expect(response).to have_http_status(:found)
    end

    it 'created news' do
      expect do
        post '/news', params: { news: news_params }
      end.to change(News, :count).by 1
    end

    it 'created failed' do
      post '/news', params: { news: news_params.merge(title: nil) }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET /news/new' do
    before do
      sign_in admin
    end

    it 'request success' do
      get new_news_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /news/:id/edit' do
    before do
      sign_in admin
    end

    it 'request success' do
      get edit_news_path(news.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /news/:id' do
    it 'request success' do
      get news_path(news.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /news/:id' do
    before do
      sign_in admin
    end

    it 'request success' do
      put news_path(news.id), params: { news: update_news_params }
      expect(response).to have_http_status(:found)
    end

    it 'updated news' do
      put news_path(news.id), params: { news: update_news_params }
      expect(news.reload.content.body.to_s).to eq "<div class=\"trix-content\">\n  <p>version1.1での変更点</p>\n</div>\n"
    end

    it 'updated fail' do
      put news_path(news.id), params: { news: update_news_params.merge(title: nil) }
      expect(response).to have_http_status(:ok)
      expect(flash[:alert]).to eq '更新が失敗しました。'
    end
  end

  describe 'DELETE /news/:id' do
    before do
      sign_in admin
    end

    it 'request success' do
      delete news_path(news.id)
      expect(response).to have_http_status(:found)
    end

    it 'request fail' do
      delete news_path(news.id + 1)
      expect(response).to have_http_status(:found)
      expect(flash[:alert]).to eq '削除に失敗しました。'
    end

    it 'destroy news' do
      news
      expect do
        delete news_path(news.id)
      end.to change(News, :count).by(-1)
    end
  end
end
