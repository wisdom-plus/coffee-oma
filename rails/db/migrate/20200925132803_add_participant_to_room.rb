class AddParticipantToRoom < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :participant1, null: false, foregin_key: {to_table: :users}
    add_reference :rooms, :participant2, null: false, foregin_key: {to_table: :users}
  end
end
