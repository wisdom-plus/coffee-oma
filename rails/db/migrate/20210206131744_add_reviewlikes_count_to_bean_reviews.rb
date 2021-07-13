class AddReviewlikesCountToBeanReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :bean_reviews, :reviewlikes_count, :integer, null: false, default: 0
  end
end
