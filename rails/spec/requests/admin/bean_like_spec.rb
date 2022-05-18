require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }

  describe 'BeanLike' do
    before do
      user
      bean
      sign_in admin
    end

    it 'created resource' do
      expect do
        post admin_bean_likes_path, params: { bean_like: attributes_for(:like, user_id: user.id, liked_id: bean.id, type: 'BeanLike') }
      end.to change(Like, :count).by 1
    end
  end
end
