class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :user, type: :bigint, foreign_key: true
      t.references :follow,type: :bigint ,foreign_key: { to_table: :users}
      t.timestamps

      t.index [:user_id, :follow_id],unique: true
    end
  end
end
