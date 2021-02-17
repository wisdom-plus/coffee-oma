  require 'rails_helper'

RSpec.describe 'History', type: :system do
  let(:user) { create(:user)}
  let(:product) { create(:product)}
  let(:bean) { create(:bean, user: user)}
  let(:history1) { create(:history, product: product, user: user)}
  let(:history2) { create(:history, bean: bean, user: user)}

  describe 'index' do
    before do
      history1
      history2
    end

    context 'when login' do
      before do
        login(user, user.email, user.password)
      end

      it 'render history'
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
end
