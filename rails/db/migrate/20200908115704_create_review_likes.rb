class CreateReviewLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :review_likes do |t|
      t.references :user
      t.references :review

      t.timestamps
    end
  end
end
