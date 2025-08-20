class AddIndexesForPerformance < ActiveRecord::Migration[8.0]
  def change
    add_index :sleep_durations, [:user_id, :end_time], name: 'index_sleep_durations_user_end_time'
    add_index :sleep_durations, [:end_time, :start_time, :user_id, :duration], name: 'index_sleep_durations_composite'
    add_index :clock_ins, :created_at
  end
end
