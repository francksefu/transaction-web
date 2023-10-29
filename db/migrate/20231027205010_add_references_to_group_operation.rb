class AddReferencesToGroupOperation < ActiveRecord::Migration[7.1]
  def change
    change_table :group_operations do |t|
      t.references :operation, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
    end
  end
end
