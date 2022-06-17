require 'rails_helper'

RSpec.describe 'Beans', type: :system do
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test1') }
  let(:bean) { create(:bean, user: user) }
  let(:bean1) { create(:bean, name: '珈琲屋の豆', user: user1) }

  describe 'new' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
        visit new_bean_path
      end

      it 'create bean' do
        expect do
          fill_in 'name', with: '珈琲豆'
          fill_in 'country', with: 'コロンビア'
          fill_in 'area', with: 'パトロ'
          select 'イタリアン', from: 'bean_roast'
          select 'ナチェラル', from: 'bean_purification'
          fill_in 'url', with: 'https://example.com'
          find('#tag', visible: false).set('コーヒー,豆')
          fill_in 'description', with: 'これはテストです'
          click_on 'submit'
        end.to change(Bean, :count).by 1
      end

      it 'not create bean' do
        expect do
          fill_in 'name', with: ''
          fill_in 'country', with: 'コロンビア'
          fill_in 'area', with: 'パトロ'
          select 'イタリアン', from: 'bean_roast'
          select 'ナチェラル', from: 'bean_purification'
          fill_in 'url', with: 'https://example.com'
          find('#tag', visible: false).set('コーヒー,豆')
          fill_in 'description', with: 'これはテストです'
          click_on 'submit'
        end.not_to change(Bean, :count)
      end
    end

    context 'when not login' do
      it 'redirect sign_in' do
        visit new_bean_path
        expect(page).to have_current_path new_user_session_path
      end
    end
  end

  describe 'index' do
    before do
      bean
      bean1
      visit beans_path
    end

    it 'displayed bean1' do
      link = all('a.ui.fluid.link.card.post')[1]
      expect(link[:href]).to eq bean_path(bean1.id)
    end
  end

  describe 'show' do
    before do
      bean
      visit bean_path(bean.id)
    end

    it 'display test', :aggregate_failures do
      visit bean_path(bean.id)
      expect(page).to have_content bean.name
      expect(page).to have_css '.ui.teal.tag.label'
    end

    it 'redirect index(tag)' do
      visit bean_path(bean.id)
      click_on 'コーヒー豆 (1)'
      expect(page).to have_current_path beans_path, ignore_query: true
    end

    it 'redirect index(bean not exists)' do
      visit bean_path(bean.id + 1)
      expect(page).to have_current_path beans_path, ignore_query: true
      expect(page).to have_content '存在しないページです。'
    end
  end
end
