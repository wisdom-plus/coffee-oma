class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
        t.references :user
        t.references :product
        t.string :title, null: false
        t.text :content, null: false

      t.timestamps
    end
  end
end
