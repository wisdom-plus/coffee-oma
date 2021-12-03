class AddRateSumToProducts < ActiveRecord::Migration[6.1]
  def self.up
    add_column :products, :rate_sum, :integer, null: false, default: 0
  end

  def self.down
    remove_column :products, :rate_sum
  end
end
