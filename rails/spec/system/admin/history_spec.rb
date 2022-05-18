require 'rails_helper'

RSpec.describe 'Admin history', type: :system do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }
  let(:history1) { create(:history, product: product, user: user) }
  let(:history2) { create(:history, bean: bean, user: user) }

  describe 'history' do
    before do
      admin_login(admin)
      history1
      history2
      visit admin_histories_path
    end

    it 'displayed index' do
      expect(page).to have_content '履歴'
    end

    it 'displayed show(product)' do
      visit admin_history_path(history1.id)
      expect(page).to have_content user.username
      expect(page).to have_content product.itemname
    end

    it 'displayed show(bean)' do
      visit admin_history_path(history2.id)
      expect(page).to have_content user.username
      expect(page).to have_content bean.name
    end

    it 'delete resource' do
      expect do
        visit admin_history_path(history1.id)
        click_on '履歴 を削除する'
      end.to change(History, :count).by(-1)
    end
  end
end
