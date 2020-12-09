class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :powdergram, null: false
      t.string :grinding, null: false
      t.integer :temperature, null: false
      t.integer :time, null: false
      t.integer :amount, null: false
      t.references :user, foreign_key: true
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
