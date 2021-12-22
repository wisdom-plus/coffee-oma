require 'rails_helper'

RSpec.describe 'Tags', type: :request do
  let_it_be(:user) { create(:user) }
  let_it_be(:product) { create(:product,user: user) }
  let_it_be(:bean) { create(:bean, user: user) }
  let_it_be(:tag_list) { 'coffee bean' }

  describe 'PATCH /tag' do
    it 'request success(product)' do
      patch tag_path(product.id), params: { type: 'Product', tag_list: tag_list }
      expect(response).to have_http_status(:found)
    end

    it 'request success(bean)' do
      patch tag_path(bean.id), params: { type: 'Bean', tag_list: tag_list }
      expect(response).to have_http_status(:found)
    end
  end
end
