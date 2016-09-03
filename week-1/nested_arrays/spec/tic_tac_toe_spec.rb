require_relative '../tic_tac_toe'

describe 'generating a tic-tac-toe board' do
  let (:array) { generate_tic_tac_toe }

  it 'has 3 rows' do
    expect(array.length).to eq 3
  end

  it 'has 3 columns' do
    expect(array[0].length).to eq 3
    expect(array[1].length).to eq 3
    expect(array[2].length).to eq 3
  end

  it 'has only Xs and Os' do
    expect(array[0][0]).to match("O").or match("X")
  end

# stretch tests goal replicates actual tic tac toe game patterns

end
