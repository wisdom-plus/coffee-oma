require 'rails_helper'

RSpec.describe 'News', type: :system do
  let(:admin) { create(:admin_user) }
  let(:news) { create(:news, user: admin) }
  let(:news1) { create(:news, user: admin, title: '訂正のお知らせ', content: "<h4>good bye</h4>") }

  describe 'index' do
    before do
      news
      news1
      visit news_index_path
    end

    it 'displayed news' do
      link = first('.spec-item')
      link1 = all('.spec-item').last
      expect(link[:href]).to eq news_path(news.id)
      expect(link1[:href]).to eq news_path(news1.id)
    end
  end

  describe 'show' do
    before do
      news
      visit news_path(news.id)
    end

    it 'display news' do
      expect(page).to have_content news.title
      expect(page).to have_content I18n.l(news.publicshed_at, format: :news_short)
    end
  end

  describe 'new', js: true do
    context 'when login' do
      before do
        admin_login(admin)
        visit new_news_path
      end

      it 'create news' do
        expect do
          fill_in 'news_title', with: '運営からのお知らせ'
          select '2021', from: 'news_publicshed_at_1i'
          select '08', from: 'news_publicshed_at_2i'
          select '20', from: 'news_publicshed_at_3i'
          fill_in_rich_text_area 'content', with: '運営から新しい機能のお知らせ'
          click_on 'submit'
        end.to change(News, :count).by 1
      end
    end

    context 'when not login' do
      it 'redirect sign_in' do
        visit new_news_path
        expect(page).to have_current_path new_admin_user_session_path, ignore_query: true
      end
    end
  end

  describe 'edit',js: true do
    context 'when login' do
      before do
        admin_login(admin)
        visit edit_news_path(news.id)
      end

      it 'edit news' do
        fill_in 'title', with: '運営からのお知らせ（更新）'
        select '2021', from: 'news_publicshed_at_1i'
        select '09', from: 'news_publicshed_at_2i'
        select '01', from: 'news_publicshed_at_3i'
        fill_in_rich_text_area 'content', with: '運営から訂正のお知らせ'
        click_on 'submit'
        expect(News.first.title).to eq '運営からのお知らせ（更新）'
      end
    end

    context 'when not login' do
      it 'redirect sign_in' do
        visit edit_news_path(news.id)
        expect(page).to have_current_path new_admin_user_session_path, ignore_query: true
      end
    end
  end
end
