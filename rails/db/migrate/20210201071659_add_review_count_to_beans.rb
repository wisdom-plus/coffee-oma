class AddReviewCountToBeans < ActiveRecord::Migration[6.0]
  def self.up
    add_column :beans, :review_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :beans, :review_count
  end
end
