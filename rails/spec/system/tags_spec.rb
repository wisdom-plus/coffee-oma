require 'rails_helper'

RSpec.describe "Tags", type: :system, js: true do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:bean) { create(:bean, user: user)}

  describe 'update' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
      end

      it 'update tag_list(product)' do
        visit product_path(product.id)
        find('#accordion').click
        fill_in 'tag_list', with: 'coffee'
        click_on '登録'
        expect(page).to have_link 'coffee (1)'
      end

      it 'update tag_list(bean)' do
        visit bean_path(bean.id)
        first('#accordion').click
        fill_in 'tag_list', with: 'bean'
        click_on '登録'
        expect(page).to have_link 'bean (1)'
      end
    end
  end
end
