require 'rails_helper'

RSpec.describe 'Tags' do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }
  let(:tag_list) { 'coffee,bean' }

  describe 'PATCH /tag' do
    it 'request success(product)' do
      post tags_path(product.id, format: :turbo_stream, subaction: :refresh), params: { type: 'Product', tag_list: tag_list }
      expect(response).to have_http_status(:found)
    end

    it 'request success(bean)' do
      post tags_path(bean.id, format: :turbo_stream, subaction: :refresh), params: { type: 'Bean', tag_list: tag_list }
      expect(response).to have_http_status(:found)
    end
  end
end
