class AddIndexToRoom < ActiveRecord::Migration[6.0]
  def change
    add_index :rooms, [:participant1_id,:participant2_id], :name => "uique_partcipant1_partcipant2", :unique => true
  end
end
