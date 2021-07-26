class AddBeanreviewToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :bean_review, foreign_key: true
  end
end
