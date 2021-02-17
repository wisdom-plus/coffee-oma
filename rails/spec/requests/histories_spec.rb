require 'rails_helper'

RSpec.describe "Histories", type: :request do
  let(:user) { create(:user)}
  let(:product) { create(:product)}
  let(:bean) { create(:bean, user: user)}
  let(:history1) { create(:history, product: product, user: user)}
  let(:history2) { create(:history, bean: bean, user: user)}

  describe "GET /index" do
    context 'when login' do
      before do
        user.confirm
        sign_in user
        history1
        history2
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
