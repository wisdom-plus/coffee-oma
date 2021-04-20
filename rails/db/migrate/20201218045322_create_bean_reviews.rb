class CreateBeanReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :bean_reviews do |t|
      t.integer :acidity
      t.integer :sweet
      t.integer :rich
      t.integer :bitter
      t.integer :flavor
      t.references :bean, foregin_key: true
      t.references :user, foregin_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
