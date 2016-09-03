require_relative '../prime_factors'

describe 'prime_factors' do
  context 'returns correct factors' do
    it 'returns correct factors of 3' do
      expect(prime_factors(3)).to match_array [3]
    end

    it 'returns correct factors of 4' do
      expect(prime_factors(4)).to match_array [2, 2]
    end

    it 'returns correct factors of 6' do
      expect(prime_factors(6)).to match_array [2, 3]
    end

    it 'returns correct factors of 8' do
      expect(prime_factors(8)).to match_array [2, 2, 2]
    end

    it 'returns correct factors of 123123123' do
      expect(prime_factors(123123123)).to match_array [3, 3, 41, 333667]
    end
  end

  context 'handles weird edge cases' do
    it 'handles zero' do
      expect(prime_factors(0)).to eq "Zero has no whole factors."
    end

    it 'handles one' do
      expect(prime_factors(1)).to eq "One is not a prime number."
    end
  end
end
