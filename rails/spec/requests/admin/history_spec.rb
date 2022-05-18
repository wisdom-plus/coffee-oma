require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }


  describe 'History' do
    before do
      user
      product
      bean
      sign_in admin
    end

    it 'created resource(product)' do
      expect do
        post admin_histories_path, params: { history: attributes_for(:history, product_id: product.id, user_id: user.id) }
      end.to change(History, :count).by 1
    end

    it 'created resource(bean)' do
      expect do
        post admin_histories_path, params: { history: attributes_for(:history, bean_id: bean.id, user_id: user.id) }
      end.to change(History, :count).by 1
    end
  end
end
