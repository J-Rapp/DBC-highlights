require_relative 'deck'
require_relative 'flashcard'

module Controller

  def self.run(file_name)
    cards = create_flashcards(file_name)
    deck = create_deck(cards)

    until deck.flashcards.empty?
      flashcard = remove_flashcard(deck)
      View.display_question(flashcard.question)
      educated_guess = View.get_input_from_user
      if flashcard.correct?(educated_guess)
        deck.correct_answers += 1
        View.display_confirmation
      else
        View.display_rejection
      end
    end
    View.display_summary(deck.correct_answers, deck.decklength)
  end

  private

  def self.remove_flashcard(deck)
    deck.flashcards.shuffle!.shift
  end

  def self.create_deck(cards)
    Deck.new(cards)
  end

  def self.create_flashcards(file_name)
    array = []
    File.foreach(file_name).each_slice(3) do | three_lines |
      hash = {
      :question => three_lines[0].chomp("\n"),
      :answer => three_lines[1].chomp("\n")
      }
      array << hash
    end
    array.map do | hash |
      Flashcard.new(hash)
    end
  end
end
