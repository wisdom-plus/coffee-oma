class CreateBeans < ActiveRecord::Migration[6.0]
  def change
    create_table :beans do |t|
      t.string :name, null: false
      t.integer :roast, null: false, default: 0
      t.text :url
      t.string :purification
      t.string :country, null: false
      t.string :area
      t.text :description
      t.references :user, foregin_key: true
      t.timestamps
    end
  end
end
