class AddReviewlikesCountToReviews < ActiveRecord::Migration[6.0]
  def self.up
    add_column :reviews, :reviewlikes_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :reviews, :reviewlikes_count
  end
end
