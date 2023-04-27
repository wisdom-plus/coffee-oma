require 'rails_helper'

RSpec.describe 'Histories' do
  let_it_be(:user) { create(:user) }
  let_it_be(:product) { create(:product, user: user) }
  let_it_be(:bean) { create(:bean, user: user) }
  let_it_be(:product_history) { create(:history, product: product, user: user) }
  let_it_be(:bean_history) { create(:history, bean: bean, user: user) }

  describe 'GET /index' do
    context 'when login' do
      before do
        user.confirm
        sign_in user
        product_history
        bean_history
      end

      it 'request success' do
        get histories_path
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when not login' do
      it 'request fail' do
        get histories_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
