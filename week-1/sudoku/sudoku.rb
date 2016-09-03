
def solve(board_string)
  current_board = input_to_array(board_string)
  current_address = [0, 0]

  # START THE BOARD ITERATION
  until # WHAT CONDITION
  # IS 'UNTIL' EVEN A GOOD METHOD TO USE FOR ITERATING?
    current_address = find_next_empty_cell(current_board, current_address)

    cell_possibilities = (1..9).to_a   # the is [1,2,3,4,5,6,7,8,9]

    possibilties_after_row = cell_possibilities - current_row_values(current_board, current_address[0])
    possibilties_after_column = possibilties_after_row - current_column_values(current_board, current_address[1])
    possibilties_after_box = possibilties_after_column - current_box_values(current_board, current_address)

    remaining_possibilities = possibilties_after_box


    if remaining_possibilities.length == 1
      # PLACE THE ONE POSSIBILITY IN THE CELL
      current_board[current_address[0]][current_address[1]] = remaining_possibilities[0]
    # elsif
      # INFINITE LOOP CASE? IS THIS WHERE ADVANCED LOGIC COMES INTO PLAY?
    else
      # START AGAIN
      # WHAT THE HELL HAPPENS WHEN WE REACH THE END OF THE BOARD?
      # HOW DO WE EVEN TEST FOR THAT WITH OUR NEXT EMPTY CELL CHECKER?
    end

  end

# outputs 'solved_board' which is still a nested array
end


def solved?(board)
# input is nested array structure

board.each do |array|
  array.each do |cell|
    return false if cell == nil
  end
end
true

end

# Prints a formatted board
def pretty_board(model)
  output_string = ""

  model.each do |row|
    replaced =  row.map do |cell|
      if cell.class == Fixnum
        cell
      else
        cell = "-"
      end
    end

    output_string << (replaced.join + "\n")
  end

  output_string
end

# Method to transform input string to nested array
def input_to_array(string)
  array = string.scan(/./)
  array = array.map do |element|
    if element =~ /[1-9]/
      element.to_i
    else
      nil
    end
  end
  model = []
  model[0] = array[0..8]
  model[1] = array[9..17]
  model[2] = array[18..26]
  model[3] = array[27..35]
  model[4] = array[36..44]
  model[5] = array[45..53]
  model[6] = array[54..62]
  model[7] = array[63..71]
  model[8] = array[72..80]
  model
end

# takes whatever nil you are currently on finds the next one
def find_next_empty_cell(model, address)
  cell_address = []
  cell_address[0] = model.drop(address[0]).index do | row |
    cell_address[1] = row.drop(address[1] + 1).index do | cell |
      cell == nil
    end + (address[1] + 1) # WHEN .INDEX DOESNT FIND IT, RETURNS NIL. YOU CAN'T ADD WITH NIL
  end + (address[0]) # WHEN .INDEX DOESNT FIND IT, RETURNS NIL. YOU CAN'T ADD WITH NIL
  cell_address # this is an array of coordinates [4,6]
  # MIGHT WE GET THIS TO RETURN NIL
end

def current_row_values(model, row_index)
  # Grab the current values in a given row
  # Return an array
  model[row_index] # later maybe call .compact to eliminate nils
end

def current_column_values(model, column_index)
  # grab current value from same column in each row
  # return an array
  column_values = []

  model.each do | row |
     column_values << row[column_index]
  end
  column_values # later maybe call .compact to eliminate nils
end

def current_box_values(model, address)
  box_values = []
  box_coordinates = []

  # Change the address array to be the 'box coordinates range' it resides in
  address.each do |number|
    i = address.index(number)
    if number <= 2
      box_coordinates[i] = (0..2)
    elsif number >= 6
      box_coordinates[i] = (6..8)
    else
      box_coordinates[i] = (3..5)
    end
  end
  # Address is now a nested array, ex. address of [4, 6] is [(3..5)(6..8)]
  # Maybe later we 'label' these 9 boxes for more advanced logic? ex. "Box [(3..5)(6..8)]" is Box 6

  # We can get the box values by taking the (three row range) first and then the (column index range) therein
  model[box_coordinates[0]].each do | array |
    box_values << array[box_coordinates[1]]
  end

  box_values.flatten
end




first_board_string = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"
p solve(first_board_string)











