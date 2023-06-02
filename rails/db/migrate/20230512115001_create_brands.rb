class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.string :logo
      t.text :description
      t.string :website

      t.timestamps
    end
  end
end
