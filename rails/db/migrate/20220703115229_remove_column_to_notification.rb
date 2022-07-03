class RemoveColumnToNotification < ActiveRecord::Migration[6.1]
  def change
    change_table :notifications do |t|
      t.remove :visited_id, :visitor_id, :like_id, :message_id
      t.rename :visited_id, :user_id
    end

  end
end
