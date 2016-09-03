require_relative 'controller'

module View
  def self.execute(file_name)
    Controller.run(file_name)
  end

  def self.get_input_from_user
    input = $stdin.gets.chomp
  end

  def self.display_question(question)
    puts question
  end

  def self.display_confirmation
    puts "Correct!\n"
  end

  def self.display_rejection
    puts "Wrong!\n"
  end

  def self.display_summary(correct, total)
    puts "You got #{correct} out of #{total} correct!"
  end
end

View.execute(ARGV[0])

