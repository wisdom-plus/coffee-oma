require 'rails_helper'

RSpec.describe 'History' do
  let(:user) { create(:user) }
  let(:brand) { create(:brand) }
  let(:product) { create(:product, user: user, brand: brand) }
  let(:bean) { create(:bean, user: user) }
  let(:product_history) { create(:history, product: product, user: user) }
  let(:bean_history) { create(:history, bean: bean, user: user) }

  describe 'index' do
    before do
      product_history
      bean_history
    end

    context 'when login' do
      it 'render history' do
        login(user, user.email, user.password)
        visit histories_path
        expect(page).to have_link nil, href: product_path(product.id)
        expect(page).to have_link nil, href: bean_path(bean.id)
      end
    end

    context 'when not login' do
      it 'redirect sign_in' do
        visit histories_path
        expect(page).to have_current_path new_user_session_path, ignore_query: true
      end
    end
  end

  describe 'create' do
    before do
      login(user, user.email, user.password)
      product
      bean
    end

    around(:example, :perform_enqueued_jobs) do |example|
      perform_enqueued_jobs do
        example.run
      end
    end

    it 'create history(product)', :perform_enqueued_jobs do
      expect do
        visit product_path(product.id)
      end.to change(History, :count).by 1
    end

    it 'not create history(product)' do
      expect do
        visit product_path(product.id + 1)
      end.not_to change(History, :count)
    end

    it 'create history(bean)', :perform_enqueued_jobs do
      expect do
        visit bean_path(bean.id)
      end.to change(History, :count).by 1
    end

    it 'not create history(bean)' do
      expect do
        visit bean_path(bean.id + 1)
      end.not_to change(History, :count)
    end

    it 'check the order of history', :perform_enqueued_jobs do
      visit product_path(product.id)
      visit bean_path(bean.id)
      visit histories_path
      bean_history_item = all('.spec-item')[0]
      product_history_item = all('.spec-item')[1]
      expect(bean_history_item[:href]).to eq bean_path(bean.id)
      expect(product_history_item[:href]).to eq product_path(product.id)
    end
  end
end
