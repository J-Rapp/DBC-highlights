require_relative '../sudoku'

describe "Sudoku" do

  let(:input){"1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"}
  let(:model){[[1, nil, 5, 8, nil, 2, nil, nil, nil], [nil, 9, nil, nil, 7, 6, 4, nil, 5], [2, nil, nil, 4, nil, nil, 8, 1, 9], [nil, 1, 9, nil, nil, 7, 3, nil, 6], [7, 6, 2, nil, 8, 3, nil, 9, nil], [nil, nil, nil, nil, 6, 1, nil, 5, nil], [nil, nil, 7, 6, nil, nil, nil, 3, nil], [4, 3, nil, nil, 2, nil, 5, nil, 1], [6, nil, nil, 3, nil, 8, 9, nil, nil]]}
  let(:working_model){input_to_array(input)}
  #let(:converted_model){[[1, "-", 5, 8, "-", 2, "-", "-", "-"], ["-", 9, "-", "-", 7, 6, 4, "-", 5], [2, "-", "-", 4, "-", "-", 8, 1, 9], ["-", 1, 9, "-", "-", 7, 3, "-", 6], [7, 6, 2, "-", 8, 3, "-", 9, "-"], ["-", "-", "-", "-", 6, 1, "-", 5, "-"], ["-", "-", 7, 6, "-", "-", "-", 3, "-"], [4, 3, "-", "-", 2, "-", 5, "-", 1], [6, "-", "-", 3, "-", 8, 9, "-", "-"]]}


  it "should create a nested array model" do
     expect(input_to_array(input)).to eq model
  end

  it "should return a pretty string for model" do
     expect(pretty_board(model)).to be_a String
  end

  it "should return a each row followed by a new line string for linear array model" do
     expect(pretty_board(model)).to eq(
        "1-58-2---\n-9--764-5\n2--4--819\n-19--73-6\n762-83-9-\n----61-5-\n--76---3-\n43--2-5-1\n6--3-89--\n"
    )
  end

  it 'returns the address of the next empty cell' do
    expect(find_next_empty_cell(model, [0, 1])).to eq [0, 4]
  end

  # it 'returns nil if there isnt another empty cell' do
  #   expect(find_next_empty_cell(model, [8, 8])).to eq nil
  # end

  it 'returns values of a given row' do
    expect(current_row_values(model, 1)).to eq [nil, 9, nil, nil, 7, 6, 4, nil, 5]
  end

  it 'returns values of a given column' do
    expect(current_column_values(model, 4)).to eq [nil, 7, nil, nil, 8, 6, nil, 2, nil]
  end

  it 'returns values of a given box' do
    cell_address_1 = [4, 6]
    cell_address_2 = [7, 2]
    expect(current_box_values(model, cell_address_1)).to eq [3, nil, 6, nil, 9, nil, nil, 5, nil]
    expect(current_box_values(model, cell_address_2)).to eq [nil, nil, 7, 4, 3, nil, 6, nil, nil]
  end

  it 'returns true if board is solved' do
    nested_array = [[1,2,3],[1,2,3],[1,2,3]]
    expect(solved?(nested_array)).to be true
  end

  it 'returns false if board is not solved' do
    expect(solved?(model)).to be false
  end

  it 'takes in a string and returns a solved board as nested arrays' do
    expect(solve(input)).to eq(model)
  end

end












