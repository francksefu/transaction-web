class CreateGroupOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :group_operations do |t|
      t.timestamps
    end
  end
end
