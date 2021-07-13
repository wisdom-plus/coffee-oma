class AddTypeToLikes < ActiveRecord::Migration[6.0]
  def up
    add_column :likes, :type, :string
    add_column :likes, :liked_id, :bigint
    remove_reference :likes, :product
  end

  def down
    remove_column :likes, :type
    remove_column :likes, :liked_id
    add_reference :likes, :product, foreign_key: true
  end
end
