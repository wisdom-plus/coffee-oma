require 'rails_helper'

RSpec.describe 'Tags', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }
  let(:tag_list) { 'coffee,bean' }

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
