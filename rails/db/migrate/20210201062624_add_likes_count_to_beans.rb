class AddLikesCountToBeans < ActiveRecord::Migration[6.0]
  def self.up
    add_column :beans, :likes_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :beans, :likes_count
  end
end
