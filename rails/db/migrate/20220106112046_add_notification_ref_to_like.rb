class AddNotificationRefToLike < ActiveRecord::Migration[6.1]
  def change
    add_reference :notifications, :like,foreign_key: true
    remove_reference :notifications, :review
  end
end
