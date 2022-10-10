require 'rails_helper'

RSpec.describe 'Admin bean_like', type: :system do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }
  let!(:bean_like) { create(:bean_like, user: user, liked_id: bean.id) }

  describe 'bean_like' do
    before do
      admin_login(admin)
      visit admin_bean_likes_path
    end

    it 'displayed index' do
      expect(page).to have_content 'コーヒー豆お気に入り'
    end

    it 'displayed show' do
      visit admin_bean_like_path(bean_like.id)
      expect(page).to have_content user.username
    end

    it 'delete resource' do
      expect do
        visit admin_bean_like_path(bean_like.id)
        click_on 'コーヒー豆お気に入り を削除する'
      end.to change(BeanLike, :count).by(-1)
    end
  end
end
