class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.references :user, foregin_key: true
      t.references :bean, foregin_key: true
      t.references :product, foregin_key: true
      t.timestamps
    end
  end
end
