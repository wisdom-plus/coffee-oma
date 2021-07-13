class AddIconToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :icon, :string
  end
end
