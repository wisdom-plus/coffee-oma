class DropDelayedJobs < ActiveRecord::Migration[6.1]
  def change
    drop_table :delayed_jobs do |t|
      table.integer :priority, default: 0, null: false
      table.integer :attempts, default: 0, null: false
      table.text :handler,                 null: false
      table.text :last_error
      table.datetime :run_at
      table.datetime :locked_at
      table.datetime :failed_at
      table.string :locked_by
      table.string :queue
      table.timestamps null: true
    end
  end
end
