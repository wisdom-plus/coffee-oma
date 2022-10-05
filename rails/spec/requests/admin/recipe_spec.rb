require 'rails_helper'

RSpec.describe 'Admin', type: :request do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }

  describe 'Recipe' do
    it 'created resource' do
      bean_review
      sign_in admin
      expect do
        post admin_recipes_path, params: { recipe: attributes_for(:recipe, bean_review_id: bean_review.id) }
      end.to change(Recipe, :count).by 1
    end
  end
end
