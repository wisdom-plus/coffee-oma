class CreateBeanReviews < ActiveRecord::Migration[6.0]
  def change
      add_column :reviews, :acidity, :integer, default: 0
      add_column :reviews, :sweet, :integer, default: 0
      add_column :reviews, :rich, :integer, default: 0
      add_column :reviews, :bitter, :integer, default: 0
      add_column :reviews, :flavor, :integer,  default: 0
      add_column :reviews, :type, :string
      add_reference :reviews, :bean, foregin_key: true
  end
end
