require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { create(:user)}
  let(:bean) { create(:bean, user: user)}
  let(:bean_review) { create(:bean_review, user: user, bean: bean)}
  let(:build_recipe) { build(:recipe, bean_review: bean_review)}

  it 'set time' do
    build_recipe.time = 210
    expect(build_recipe.time1).to eq 3
    expect(build_recipe.time2).to eq 30
  end
end
