class RenameItemnameToNameInProducts < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :itemname, :name
    rename_column :products, :itemprice, :price
    rename_column :products, :itemurl, :url
    rename_column :products, :itemcaption, :caption
    rename_column :products, :imageurl, :image
  end
end
