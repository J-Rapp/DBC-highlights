class BoggleBoard
  attr_accessor :board, :dice

  def initialize
    @board = create_empty_board
    @dice = create_boggle_dice
  end

  def shake!
    @board = @board.map do | row |
      row.map do | space |
        reassign_space(space)
      end
    end
  end

  def to_s
    formatted_board = ''
    @board.each do |row|
      formatted_board += row.join('  ') + " \n"
    end
    formatted_board = substitute_q(formatted_board)
  end

  def include?(word)
    if word.length < 3
      puts 'Word needs to be three letters or longer.'
      return false
    end

    word = format_for_search(word)

    word_index = 0
    first_letter = word[word_index]

    if board_has_first_letter?(first_letter)
      first_letter_addresses = obtain_addresses_of_letter(first_letter)
    else
      return false
    end

    match_results = []
    first_letter_addresses.each do | word_start_address |
      used_addresses = []
      match_results << recursive_search_for_letters(word_start_address, word, word_index, used_addresses)
    end
    match_results.include?(true) ? true : false
  end

  # private

  def recursive_search_for_letters(start_address, word, word_index, used_spaces)
      return true if word_index == word.length - 1

      word_index += 1
      used_spaces << start_address
      adjacent_addresses = find_all_adjacent_addresses(start_address)
      searchable_addresses = adjacent_addresses - used_spaces

      next_letter_matches = []

      searchable_addresses.each do | adjacent_space_address |
        next_letter_matches << adjacent_space_address if space_value(adjacent_space_address) == word[word_index]
      end

      if next_letter_matches.empty?
        return false
      end

      next_letter_matches.each do | match_space |
        return true if recursive_search_for_letters(match_space, word, word_index, used_spaces)
      end
      false
  end

  def space_value(address)
    @board[address[0]][address[1]]
  end

  def find_all_adjacent_addresses(address)
    addresses = []
    addresses << address_above(address)
    addresses << address_below(address)
    addresses << address_left(address)
    addresses << address_right(address)
    addresses << address_above_right(address)
    addresses << address_above_left(address)
    addresses << address_below_right(address)
    addresses << address_below_left(address)
    addresses.compact
  end

  def address_above(address)
    above_address = []
    if address[0] == 0
      return nil
    else
      above_address[0] = address[0] - 1
      above_address[1] = address[1]
    end
    above_address
  end

   def address_below(address)
    below_address = []
    if address[0] == 3
      return nil
    else
      below_address[0] = address[0] + 1
      below_address[1] = address[1]
    end
    below_address
  end

  def address_right(address)
    right_address = []
    if address[1] == 3
      return nil
    else
      right_address[0] = address[0]
      right_address[1] = address[1] + 1
    end
    right_address
  end

  def address_left(address)
    left_address = []
    if address[1] == 0
      return nil
    else
      left_address[0] = address[0]
      left_address[1] = address[1] - 1
    end
    left_address
  end

  def address_above_right(address)
    above_right_address = []
    if address[0] == 0
      return nil
    elsif address[1] == 3
      return nil
    else
      above_right_address[0] = address[0] - 1
      above_right_address[1] = address[1] + 1
    end
    above_right_address
  end

  def address_above_left(address)
    above_left_address = []
    if address[0] == 0
      return nil
    elsif address[1] == 0
      return nil
    else
      above_left_address[0] = address[0] - 1
      above_left_address[1] = address[1] - 1
    end
    above_left_address
  end

  def address_below_left(address)
    below_left_address = []
    if address[0] == 3
      return nil
    elsif address[1] == 0
      return nil
    else
      below_left_address[0] = address[0] + 1
      below_left_address[1] = address[1] - 1
    end
    below_left_address
  end

  def address_below_right(address)
    below_right_address = []
    if address[0] == 3
      return nil
    elsif address[1] == 3
      return nil
    else
      below_right_address[0] = address[0] + 1
      below_right_address[1] = address[1] + 1
    end
    below_right_address
  end

  def obtain_addresses_of_letter(letter)
    addresses = []
    row_index = 0
    @board.each do |row|
      column_index = 0
      row.each do |space|
        if space == letter
          single_address = []
          single_address << row_index
          single_address << column_index
          addresses << single_address
        end
        column_index += 1
      end
      row_index += 1
    end
    addresses
  end

  def board_has_first_letter?(first_letter)
    @board.each do |row|
      return true if row.include?(first_letter)
    end
    false
  end

  def reassign_space(space)
    die = remove_random_die
    letter = roll_die(die)
    space = letter
  end

  def remove_random_die
    die = @dice.sample
    @dice.delete(die)
    die
  end

  def roll_die(die)
    die.sample
  end

  def substitute_q(board_string)
    board_string.gsub(/[Q]\s/, 'Qu')
  end

  def format_for_search(word)
    word.upcase.gsub(/QU/, 'Q')
  end

  def create_empty_board
    Array.new(4) do | row |
      Array.new(4, '_')
    end
  end

  def create_boggle_dice
    real_life_boggle_dice = [
      ["A", "A", "E", "E", "G", "N"],
      ["E", "L", "R", "T", "T", "Y"],
      ["A", "O", "O", "T", "T", "W"],
      ["A", "B", "B", "J", "O", "O"],
      ["E", "H", "R", "T", "V", "W"],
      ["C", "I", "M", "O", "T", "U"],
      ["D", "I", "S", "T", "T", "Y"],
      ["E", "I", "O", "S", "S", "T"],
      ["D", "E", "L", "R", "V", "Y"],
      ["A", "C", "H", "O", "P", "S"],
      ["H", "I", "M", "N", "Q", "U"],
      ["E", "E", "I", "N", "S", "U"],
      ["E", "E", "G", "H", "N", "W"],
      ["A", "F", "F", "K", "P", "S"],
      ["H", "L", "N", "N", "R", "Z"],
      ["D", "E", "I", "L", "R", "X"]
    ]
  end
end
