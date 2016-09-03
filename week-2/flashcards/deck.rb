class Deck

  attr_reader :flashcards, :decklength
  attr_accessor :correct_answers

  def initialize(cards)
    @flashcards = cards
    @correct_answers = 0
    @decklength = flashcards.length
  end

end
