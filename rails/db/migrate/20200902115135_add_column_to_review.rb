class AddColumnToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :rate, :float
  end
end
