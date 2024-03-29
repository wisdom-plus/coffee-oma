class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :powdergram, null: false
      t.integer :grinding, null: false, default: 0
      t.integer :temperature, null: false
      t.integer :time, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
