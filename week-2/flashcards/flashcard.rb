class Flashcard

  attr_reader :question, :answer

  def initialize(args)
    @question = args.fetch(:question)
    @answer = args.fetch(:answer)
  end

  def correct?(string)
    string == answer
  end

end
