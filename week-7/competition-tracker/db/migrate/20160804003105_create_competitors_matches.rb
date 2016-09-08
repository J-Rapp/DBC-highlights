class CreateCompetitorsMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :competitors_matches do |t|
      t.references :competitor, index: true
      t.references :match, index: true
    end
  end
end
