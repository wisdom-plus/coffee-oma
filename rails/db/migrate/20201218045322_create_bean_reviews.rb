class CreateBeanReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :bean_reviews do |t|
      t.integer :acidity, null: false, default: 0
      t.integer :sweet, null: false, default: 0
      t.integer :rich, null: false, default: 0
      t.integer :bitter, null: false, default: 0
      t.integer :flavor, null: false, default: 0
      t.references :user, foregin_key: true
      t.references :bean, foregin_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
