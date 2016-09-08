class RemoveWinsLosesCountsColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :competitors, :wins_count
    remove_column :competitors, :loses_count
  end
end
