class ChangeColumnToBean < ActiveRecord::Migration[6.0]
  def up
    change_column :beans, :purification, :integer, null: false, default: 0
  end

  def down
    change_column :beans, :purification, :string
  end
end
