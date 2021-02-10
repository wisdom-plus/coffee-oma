class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.references :user, foregin_key: true
      t.bigint :show_id, null: false
      t.string :controller_type, null: false
      t.timestamps
    end
  end
end
