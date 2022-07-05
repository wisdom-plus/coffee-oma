class RemoveColumnToNotification < ActiveRecord::Migration[6.1]
  def change
    remove_reference :notifications, :like
    remove_reference :notifications, :message
    remove_reference :notifications, :visitor
    remove_reference :notifications, :visited
    remove_column :notifications, :action, :string
    add_reference :notifications, :user, foreign_key: true
    add_reference :notifications, :source, polymorphic: true
  end
end
