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
    add_reference :notifications, :visitor, foreign_key: {to_table: :users}
    add_reference :notifications, :visited, foreign_key: {to_table: :users}
    add_column :notifications, :action, :string
    remove_reference :notifications, :user
    # remove_column :notifications, :source_type
    remove_reference :notifications, :source, polymorphic: true
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
