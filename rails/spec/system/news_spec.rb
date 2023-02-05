require 'rails_helper'

RSpec.describe 'News' do
  let(:admin) { create(:admin_user) }
  let(:news) { create(:news, user: admin) }
  let(:news1) { create(:news, :another_news, user: admin) }
  let(:news2) { create(:news, :after_published_new, user: admin) }

  describe 'index' do
    it 'displayed news' do
      news
      news1
      visit news_index_path
      link = first('.spec-item')
      link1 = all('.spec-item').last
      expect(link[:href]).to eq news_path(news.id)
      expect(link1[:href]).to eq news_path(news1.id)
    end
  end

  describe 'show' do
    before do
      news
      news1
      news2
    end

    it 'display news adn new1' do
      visit news_path(news.id)
      expect(page).to have_content news.title
      expect(page).to have_content I18n.l(news.publicshed_at, format: :news_short)
      visit news_path(news1.id)
      expect(page).to have_content news1.title
      expect(page).to have_content I18n.l(news1.publicshed_at, format: :news_short)
    end

    it 'display fail' do
      visit news_path(news2.id)
      expect(page).to have_content '公開させておりません。'
      expect(page).to have_current_path root_path
    end
  end

  describe 'new', js: true do
    context 'when login' do
      it 'create news' do
        admin_login(admin)
        visit new_news_path
        expect do
          fill_in 'news_title', with: '運営からのお知らせ'
          select '2021', from: 'news_publicshed_at_1i'
          select '08', from: 'news_publicshed_at_2i'
          select '20', from: 'news_publicshed_at_3i'
          fill_in_rich_text_area 'content', with: '運営から新しい機能のお知らせ'
          click_on 'submit'
        end.to change(News, :count).by 1
        expect(page).to have_content '登録が完了しました。'
        expect(page).to have_current_path root_path
      end
    end

    context 'when not login' do
      it 'redirect sign_in' do
        visit new_news_path
        expect(page).to have_current_path new_admin_user_session_path, ignore_query: true
      end
    end
  end

  describe 'edit', js: true do
    context 'when login' do
      it 'edit news' do
        admin_login(admin)
        visit edit_news_path(news.id)
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
