require_relative 'die'

class RubyRacer
  attr_reader :players, :die, :length

  def initialize(players, die)
    @players = players.map do | player |
      i = players.index(player)
      player = []
      player << ["player_symbol", players[i]]
      player << ["player_row", i]
      player << ["player_position", 0]
      Hash[player]
    end
    @die = die # we can call die.roll to get a random integer between 1 and 6
    @length = 30
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    winner ? true : false
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    winners = []
    @players.each do | player |
      winners << player["player_symbol"] if player["player_position"] == 29
    end
    winners.length > 0 ? winners.flatten : nil
  end

  # Rolls the die and advances +player+ accordingly
  def advance_player(player)
    player["player_position"] += die.roll
    player["player_position"] = 29 if player["player_position"] > 29
  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def board_visualization
    board = ''
    board_array = Array.new(@players.length) {Array.new(29, " ")}

    players.each do | player |
      board_array[player["player_row"]].insert(player["player_position"], player["player_symbol"])
    end

    board_array.each do |row|
      board += row.join(" | ") + "\n"
    end

    board
  end

  def tiebreaker_visualization
    results = ''
    tiebreaker.each do |winner_hash|
      results += "\"#{winner_hash[:symbol]}\" rolled five times and got a total of #{winner_hash[:total]}.\n"
    end
    results
  end

  def tiebreaker
    winner.map do |winner|
      tiebreak = 0
      5.times do
        tiebreak += die.roll
      end
      { :symbol => winner,
        :total => tiebreak
      }
    end
  end
end
