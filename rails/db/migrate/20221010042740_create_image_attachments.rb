class CreateImageAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :image_attachments do |t|
      t.references :imageable, null: false, polymorphic: true

      t.string :attachment, null: false
      t.timestamps
    end

    remove_column :products, :image
    remove_column :beans, :image
  end
end
