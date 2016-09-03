require_relative '../boggle_board'

describe "Boggle Board 1 - Release 0" do

  let(:board) { BoggleBoard.new }

  it "can be shaken" do
    expect{board.shake!}.not_to raise_error
  end

  it 'has a printable representation of 4 underscores in each of 4 rows on separate lines BEFORE it is shaken' do
    expect(board.to_s).to match(/_\s*{4}${4}/)
  end

  it 'has a printable representation of 4 letters in each of 4 rows on separate lines AFTER it is shaken' do
    board.shake!
    expect(board.to_s).to match(/[A-Z]\s*{4}${4}/)
  end

  it 'has the same state every time to_s is called' do
    first_string = board.to_s
    second_string = board.to_s
    expect(first_string).to eq second_string
  end

  it 'has a different state after shake is called' do
    first_string = board.to_s
    board.shake!
    second_string = board.to_s
    expect(first_string).not_to eq second_string
  end

  it 'has 4 rows' do
    expect(board.shake!.length).to eq(4)
  end

  it 'has 4 rows with 4 letters each' do
    expect(board.shake!.all? {|row| row.length == 4}).to be_true
  end

end

describe "Boggle Board 1 - Release 1" do

  let(:board) { BoggleBoard.new }

  describe '::create_boggle_dice' do
    it 'creates an array of 16 die' do
      expect(board.dice.length).to eq 16
    end

    it 'creates dice with six sides' do
      expect(board.dice[rand(1..16)].length).to eq 6
    end
  end

  describe '::remove_random_die' do
    let(:die) { board.remove_random_die }

    it 'should return a die' do
      expect(die.length).to eq 6
    end

    it 'should remove a die when it is assigned to a space' do
      expect(board.dice).not_to include(die)
    end

    it 'should remove all dice from instance attribute' do
      board.shake!
      expect(board.dice.length).to be 0
    end
  end

  describe '::roll_die' do
    let(:die) { board.dice.sample }

    it 'should return a letter' do
      expect(board.roll_die(die)).to be_a String
    end
  end

end

describe "Boggle Board 1 - Release 2" do

  describe '::to_s' do

    let(:board) { BoggleBoard.new }
    let(:board_string) {"X  C  Q  E \nL  E  A  S \nA  A  S  T \nH  I  Q  E \n"}
    let(:end_of_line) {"X  C  Q  E \nL  E  A  S \nA  A  S  Q \nH  I  Q  E \n"}

    it 'should substitute all Q letters to Qu' do
      expect(board.substitute_q(board_string)).to eq "X  C  Qu E \nL  E  A  S \nA  A  S  T \nH  I  Qu E \n"
    end

    it 'still formats correctly if Q is at the end of a line' do
      expect(board.substitute_q(end_of_line)).to eq "X  C  Qu E \nL  E  A  S \nA  A  S  Qu\nH  I  Qu E \n"
    end

  end

end

describe "Boggle Board 2" do

  before(:each) do
    @board = BoggleBoard.new
    @board.board = [
    ["O", "R", "I", "Q"],
    ["G", "I", "Z", "G"],
    ["O", "Q", "L", "O"],
    ["C", "L", "A", "F"]
    ]
    @board.dice = nil
    @word = "gorilla"
    @word_array = @word.upcase.split('')
  end

  describe "::include?" do
    it 'should return false if the word is less than three letters' do
      expect(@board.include?("to")).to be false
    end

    it 'should convert any occurrence of Qu into Q' do
      expect(@board.include?("quiz")).to eq true
    end

    it 'should find the word in the board' do
      expect(@board.include?(@word)).to eq true
    end
  end

  describe "::find_all_adjacent_addresses" do
    it 'should find all addresses surrounding a given space' do
      expect(@board.find_all_adjacent_addresses([2,2])).to eq [[1, 2], [3, 2], [2, 1], [2, 3], [1, 3], [1, 1], [3, 3], [3, 1]]
    end

    it 'should find all addresses surrounding edge spaces' do
      expect(@board.find_all_adjacent_addresses([0,3])).to eq [[1, 3], [0, 2], [1, 2]]
    end
  end

  describe "::board_has_first_letter?" do
    it "should return true if the first letter is in the board" do
      expect(@board.board_has_first_letter?(@word_array[0])).to eq true
    end

    it "should return false if the first letter is not in the board" do
      expect(@board.board_has_first_letter?("J")).to eq false
    end
  end

  describe "::obtain_addresses_of_letter" do
    it 'should return addresses of all letter occurrences' do
      expect(@board.obtain_addresses_of_letter(@word_array[0])).to eq [[1,0], [1,3]]
    end

    it 'should return one address if the letter occurs once' do
      expect(@board.obtain_addresses_of_letter("Z")).to eq [[1,2]]
    end
  end

end
