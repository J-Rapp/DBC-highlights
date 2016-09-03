require_relative 'boggle_board'

puts "Hit enter to begin your new Boggle game!"
gets.chomp

board = BoggleBoard.new
board.shake!
points = 0

i = 10
until i == 0
  puts board.to_s
  puts "Input word:"
  input = gets.chomp
  if board.include?(input)
    puts "#{input.length - 2} point(s), sweet! (hope that was a real word, because I don't have a dictionary)\n\n"
    points += input.length - 2
  else
    puts "Nope, that word isn't in the board (according to the rules).\n\n"
  end
  i -= 1
end

puts "Game over. You scored #{points} points!"
