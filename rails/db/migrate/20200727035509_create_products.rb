class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :itemname
      t.string :catchcopy
      t.integer :itemprice
      t.text :itemcaption
      t.text :itemurl
      t.text :imageurl
      t.string :shopname

      t.timestamps
    end
  end
end
