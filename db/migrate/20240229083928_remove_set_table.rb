class RemoveSetTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :sets
  end
end
