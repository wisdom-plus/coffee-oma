class AddBrandIdToProducts < ActiveRecord::Migration[7.0]
  def up
    remove_column :products, :shopname
    add_reference :products, :brand, foreign_key: true, null: true
  end

  def down
    add_column :products, :shopname, :string
    remove_reference :products, :brand
  end
end
