class CreateBeanReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :bean_reviews do |t|
      t.integer :acidity, default: 0
      t.integer :sweet, default: 0
      t.integer :rich, default: 0
      t.integer :bitter, default: 0
      t.integer :flavor,  default: 0
      t.references :bean, foregin_key: true
      t.references :user, foregin_key: true
      t.string :title, null: false
      t.text :content, null: false
    end
  end
end
