require_relative '../ruby_racer'
require_relative '../die'

describe RubyRacer do
  let(:die) { Die.new }
  players = [:a, :b, :c]
  let(:game) { RubyRacer.new(players, die) }

  context 'Initializing Board' do

    it 'has keys' do
      expect(game.players[1]["player_symbol"]).to be :b
    end

    it 'has values' do
      expect(game.players[2]["player_position"]).to be 0
    end

  end

  context 'Finish checker' do

    it 'Returns true if someone reaches the end' do
      game.players[2]["player_position"] = 29
      expect(game.finished?).to eq true
    end

    it 'Returns false if no one has reached the end' do
      expect(game.finished?).to eq false
    end

  end

  context 'Winner Method' do

    it 'Returns the symbol of the winner' do
      game.players[1]["player_position"] = 29
      expect(game.winner).to eq [:b]
    end

    it 'Returns nil if there is no winner' do
      expect(game.winner). to eq nil
    end

  end

end
