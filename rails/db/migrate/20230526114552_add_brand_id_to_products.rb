class AddBrandIdToProducts < ActiveRecord::Migration[7.0]
  def up
    add_reference :products, :brand, null: true, foreign_key: true
  end

  def down
    remove_column :products, :shopname
  end
end
