class RemoveUniqueConstraintFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_index :users, :name

    add_index :users, :name
  end
end
