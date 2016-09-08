class Competitor < ApplicationRecord
  belongs_to :league
  has_and_belongs_to_many :matches

  validates_presence_of :name, :league_id

  def wins
    self.matches.won_by(self)
  end

  def losses
    self.matches.lost_by(self)
  end

  def results
    self.matches.reduce({}) do |results_hash, match|
      value = match.winner == self ? 'w' : 'l'
      round_symbol = :"r#{match.round_number}"
      results_hash[round_symbol] = value
      results_hash
    end
  end

end
