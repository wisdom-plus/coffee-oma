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
          fill_in 'url', with: 'https://example.com'
          fill_in 'bean_description', with: 'これはテストです'
          click_on 'submit'
        end.to change(Bean, :count).by 1
      end

      it 'not create bean' do
        expect do
          fill_in 'name', with: ''
          fill_in 'country', with: 'コロンビア'
          fill_in 'area', with: 'パトロ'
          select 'イタリアン', from: 'bean_roast'
          fill_in 'url', with: 'https://example.com'
          fill_in 'bean_description', with: 'これはテストです'
          click_on 'submit'
        end.to change(Bean, :count).by 0
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

    it 'displayed bean' do
      expect(page).to have_content bean.name
    end
  end
end
