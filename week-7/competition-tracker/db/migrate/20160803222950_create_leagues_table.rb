class CreateLeaguesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :number_of_rounds, default: 5

      t.timestamps
    end
  end
end
