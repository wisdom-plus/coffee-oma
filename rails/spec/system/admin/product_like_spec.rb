require 'rails_helper'

RSpec.describe 'Admin product_like', type: :system do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let!(:product_like) { create(:product_like, user: user, liked_id: product.id) }

  describe 'product_like' do
    before do
      admin_login(admin)
      visit admin_product_likes_path
    end

    it 'displayed index' do
      expect(page).to have_content '商品お気に入り'
    end

    it 'displayed show' do
      visit admin_product_like_path(product_like.id)
      expect(page).to have_content user.username
    end

    it 'delete resource' do
      expect do
        visit admin_product_like_path(product_like.id)
        click_on '商品お気に入り を削除する'
      end.to change(ProductLike, :count).by(-1)
    end
  end
end
