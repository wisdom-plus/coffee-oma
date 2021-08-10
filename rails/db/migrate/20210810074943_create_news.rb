class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|

      t.timestamps
    end
  end
end
