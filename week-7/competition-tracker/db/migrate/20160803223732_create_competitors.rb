class CreateCompetitors < ActiveRecord::Migration[5.0]
  def change
    create_table :competitors do |t|
      t.string :name
      t.integer :wins_count
      t.integer :loses_count

      t.references :league, index: true

      t.timestamps
    end
  end
end
