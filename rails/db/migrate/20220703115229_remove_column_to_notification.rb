class RemoveColumnToNotification < ActiveRecord::Migration[6.1]


  def up
    remove_reference :notifications, :like
    remove_reference :notifications, :message
    remove_reference :notifications, :visitor
    remove_reference :notifications, :visited
    remove_column :notifications, :action, :string
    add_reference :notifications, :user, foreign_key: true
    add_reference :notifications, :source, polymorphic: true
  end

  def down
    add_reference :notifications, :like, foreign_key: true
    add_reference :notifications, :message, foreign_key: true
    add_reference :notifications, :visitor, foreign_key: true
    add_reference :notifications, :visited, foreign_key: true
    remove_reference :notifications, :user
    remove_reference :notifications, :source
  end

  # def change
  #   remove_reference :notifications, :like
  #   remove_reference :notifications, :message
  #   remove_reference :notifications, :visitor
  #   remove_reference :notifications, :visited
  #   remove_column :notifications, :action, :string
  #   add_reference :notifications, :user, foreign_key: true
  #   add_reference :notifications, :source, polymorphic: true
  # end
end
