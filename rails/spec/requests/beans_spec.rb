require 'rails_helper'

RSpec.describe 'Beans', type: :request do
  let_it_be(:user) { create(:user) }
  let_it_be(:bean) { create(:bean, user: user) }
  let_it_be(:bean_params) { attributes_for(:bean, image: File.open('./spec/support/noimage.png')) }

  describe 'GET /new' do
    context 'when login' do
      before do
        user.confirm
        sign_in user
      end

      it 'request success' do
        get new_bean_path
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when not login' do
      it 'request fail' do
        get new_bean_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET /create' do
    context 'when login' do
      before do
        user.confirm
        sign_in user
      end

      it 'request success' do
        post beans_path, params: { bean: bean_params }
        expect(response).to have_http_status(:found)
      end

      it 'created bean' do
        expect do
          post beans_path, params: { bean: bean_params }
        end.to change(Bean, :count).by 1
      end
    end

    context 'when not login' do
      it 'request fail' do
        post beans_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET /bean/:id' do
    it 'request success' do
      get bean_path(bean.id)
      expect(response).to have_http_status(:ok)
    end

    it 'request fail' do
      get bean_path(bean.id + 1)
      expect(response).to have_http_status(:see_other)
    end
  end

  describe 'GET /index' do
    it 'request success' do
      get beans_path
      expect(response).to have_http_status(:ok)
    end
  end
end
