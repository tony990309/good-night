class CreateSleepDurations < ActiveRecord::Migration[8.0]
  def change
    create_table :sleep_durations do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration

      t.timestamps
    end

    add_index :sleep_durations, :duration
  end
end
