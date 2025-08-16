class CreateClockIns < ActiveRecord::Migration[8.0]
  def change
    create_table :clock_ins do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :action_type, default: 0

      t.timestamps
    end
  end
end
