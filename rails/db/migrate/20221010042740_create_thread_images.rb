class CreateThreadImages < ActiveRecord::Migration[6.1]
  def change
    create_table :thread_images do |t|
      t.references :imageable, null: false, polymorphic: true

      t.string :attachment
      t.timestamps
    end

    remove_column :products, :image, :string
    remove_column :beans, :image, :string
  end
end
