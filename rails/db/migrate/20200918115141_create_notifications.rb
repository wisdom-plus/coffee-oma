class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :visitor,type: :bigint, foreign_key: {to_table: :users}
      t.references :visited,type: :bigint ,foreign_key: {to_table: :users}
      t.references :review,type: :bigint ,foreign_key: true
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false


      t.timestamps
    end
  end
end
