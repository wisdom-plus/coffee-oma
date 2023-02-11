class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :provider, :string, null: false, default: 'email'
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :tokens, :text
    add_column :users, :allow_password_change, :boolean, default: false
    add_index :users, %i[uid provider], unique: true
  end
end
