# == Schema Information
#
# Table name: recipes
#
#  id             :bigint           not null, primary key
#  amount         :integer          not null
#  grinding       :integer          default("極細挽き"), not null
#  powdergram     :integer          not null
#  temperature    :integer          not null
#  time           :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  bean_review_id :bigint
#
# Indexes
#
#  index_recipes_on_bean_review_id  (bean_review_id)
#
# Foreign Keys
#
#  fk_rails_...  (bean_review_id => bean_reviews.id)
#
require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:build_recipe) { build(:recipe, bean_review: bean_review) }

  it 'set time' do
    build_recipe.time = 210
    expect(build_recipe.time1).to eq 3
    expect(build_recipe.time2).to eq 30
  end
end
