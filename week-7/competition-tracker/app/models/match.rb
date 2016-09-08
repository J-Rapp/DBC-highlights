class Match < ApplicationRecord

  attr_accessor :competitor_one_id, :competitor_two_id

  belongs_to :league
  has_and_belongs_to_many :competitors

  belongs_to :winner, class_name: :Competitor, required: false
  belongs_to :loser, class_name: :Competitor, required: false

  scope :from_round, ->(round_number) { where(round_number: round_number) }

  validates_presence_of :league_id

  scope :won_by, -> ( winner ){ where(winner: winner) }

  scope :lost_by, -> ( loser ){ where(loser: loser) }

  validate :validate_competitors

  def validate_competitors
    errors.add(:competitors, ': pick two to create a match') if competitors.size != 2
  end

  before_validation :load_competitors

  def load_competitors
    input = [self.competitor_one_id.to_i, self.competitor_two_id.to_i].uniq
    current = self.competitors.map {|c| c.id}

    add = input.reject do |i|
      i == 0 || current.include?(i)
    end

    remove = current.reject do |i|
      input.include?(i)
    end

    remove.each do |competitor_id|
      self.competitors -= [Competitor.find(competitor_id)]
    end

    add.each do |competitor_id|
      self.competitors <<  Competitor.find(competitor_id)
    end

    true
  end

end
