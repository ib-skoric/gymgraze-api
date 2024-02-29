class CreateSetTable < ActiveRecord::Migration[7.0]
  def change
    create_table :set_tables do |t|
      t.integer :reps
      t.decimal :weight

      t.timestamps
    end
  end
end
