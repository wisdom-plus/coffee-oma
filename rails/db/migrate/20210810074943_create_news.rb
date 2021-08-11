class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.text :content , null: false
      t.boolean :active, default: false
      t.datetime :publicshed_at , default: -> {'now()'}, null: false
      t.references :user, foreign_key: {to_table: :admin_users}
      t.timestamps
    end
  end
end
