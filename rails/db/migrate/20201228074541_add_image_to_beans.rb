class AddImageToBeans < ActiveRecord::Migration[6.0]
  def change
    add_column :beans, :image, :string
  end
end
