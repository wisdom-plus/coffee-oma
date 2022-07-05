class RemoveColumnToNotification < ActiveRecord::Migration[6.1]
  def change
    remove_reference :notifications, :like
    remove_reference :notifications, :message
    remove_reference :notifications, :visitor
    remove_reference :notifications, :visited
    add_reference :notifications, :user, foreign_key: true
    add_column :notifications, :record_id, :bigint, null: false
  end
end
