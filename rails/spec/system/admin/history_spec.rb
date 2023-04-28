require 'rails_helper'

RSpec.describe 'Admin history' do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }
  let!(:product_history) { create(:history, product: product, user: user) }
  let!(:bean_history) { create(:history, bean: bean, user: user) }

  describe 'history' do
    before do
      admin_login(admin)
      visit admin_histories_path
    end

    it 'displayed index' do
      expect(page).to have_content '履歴'
    end

    it 'displayed show(product)' do
      visit admin_history_path(product_history.id)
      expect(page).to have_content user.username
      expect(page).to have_content product.name
    end

    it 'displayed show(bean)' do
      visit admin_history_path(bean_history.id)
      expect(page).to have_content user.username
      expect(page).to have_content bean.name
    end

    it 'delete resource' do
      expect do
        visit admin_history_path(product_history.id)
        click_on '履歴 を削除する'
      end.to change(History, :count).by(-1)
    end
  end
end
