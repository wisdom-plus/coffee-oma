require 'rails_helper'

RSpec.describe "BeanReviews", type: :system do
  let(:user) { create(:user)}
  let(:bean) { create(:bean)}
  let(:bean_review) { create(:bean_review)}

  describe "create" do
    context "when login" do
      before do
        login(user, user.email, user.password)
        visit bean_path(bean.id)
      end
    end

    context "when not login" do
      it 'is not render review_form' do
        visit bean_path(bean.id)
        expect(page).to have_no_css '#bean_review_form'
      end
    end

  end

end
