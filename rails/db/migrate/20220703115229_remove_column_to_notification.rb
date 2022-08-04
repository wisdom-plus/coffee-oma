class RemoveColumnToNotification < ActiveRecord::Migration[6.1]
  class Notification < ActiveRecord::Base
  end

  def up
    remove_reference :notifications, :like
    remove_reference :notifications, :message
    remove_reference :notifications, :visitor
    remove_reference :notifications, :visited
    remove_column :notifications, :action, :string
    add_reference :notifications, :user, foreign_key: true
    add_reference :notifications, :source, polymorphic: true

    Notification.reset_column_information
    Notification.find_each do |n|
      n.destroy!
    end
  end

  def down
    add_reference :notifications, :like, foreign_key: true
    add_reference :notifications, :message, foreign_key: true
    add_reference :notifications, :visitor, foreign_key: {to_table: :users}
    add_reference :notifications, :visited, foreign_key: {to_table: :users}
    add_column :notifications, :action, :string
    remove_reference :notifications, :user
    remove_reference :notifications, :source, polymorphic: true

    Notification.reset_column_information
    Notification.find_each do |n|
      n.destroy!
    end
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
