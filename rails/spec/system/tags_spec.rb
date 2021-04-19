require 'rails_helper'

RSpec.describe 'Tags', type: :system, js: true do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:bean) { create(:bean, user: user) }

  describe 'update' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
      end

      it 'update tag_list(product)' do
        visit product_path(product.id)
        first('#accordion').click
        page.execute_script "$('#spec_tag_form').val('コーヒー,coffee');"
        click_on '更新'
        expect(page).to have_link 'coffee (1)'
      end

      it 'update tag_list(bean)' do
        visit bean_path(bean.id)
        first('#accordion').click
        page.execute_script "$('#spec_tag_form').val('コーヒー豆,bean');"
        click_button '更新'
        expect(page).to have_link 'bean (1)'
      end
    end
  end
end
