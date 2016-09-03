require_relative 'die'
require_relative 'ruby_racer'
require_relative 'reset_screen'


players = [:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p, :q, :r, :s, :t, :u, :v, :w, :x, :y, :z]
die = Die.new

game = RubyRacer.new(players, die)

# Clear the screen and print the board
# with players in their starting positions.
# Then pause, so users can see the starting board.
reset_screen
puts game.board_visualization
sleep(1)

# Play the game.
until game.finished?
  # Do this each round until the game is finished.

  # Move each player forward.
  game.players.each do |player|
    game.advance_player(player)
  end

  # Now that each player has moved,
  # reprint the board with the new player positions
  # and pause so users can see the updated board.
  reset_screen
  puts game.board_visualization
  sleep(0.4)
end

# Once the game is finished, report the winner.
if game.winner.length == 1
  puts "Player '#{game.winner[0]}' wins!"
else
  puts "Time for a tie-breaker!"
  puts game.tiebreaker_visualization
end
