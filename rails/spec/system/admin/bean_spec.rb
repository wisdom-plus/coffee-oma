require 'rails_helper'

RSpec.describe 'Admin bean' do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }

  describe 'bean' do
    before do
      admin_login(admin)
      visit admin_beans_path
    end

    it 'displayed index' do
      expect(page).to have_content 'コーヒー豆'
    end

    it 'displayed show' do
      visit admin_bean_path(bean.id)
      expect(page).to have_content bean.name
    end

    it 'delete resource' do
      bean
      expect do
        visit admin_bean_path(bean.id)
        click_on 'コーヒー豆 を削除する'
      end.to change(Bean, :count).by(-1)
    end
  end
end
