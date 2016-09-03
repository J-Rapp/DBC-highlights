require_relative '../find_anagrams'

describe 'find_anagrams' do
let (:possible_anagrams) { ['nighthawks', 'caret', 'react', 'trace', 'otters'] }

  it 'returns any anagrams from the provided list' do
    found_anagrams = find_anagrams('crate', possible_anagrams)
    expect(found_anagrams).to match_array ['caret', 'react', 'trace']
  end

  it 'returns an empty array if no words match' do
    found_anagrams = find_anagrams('butt', possible_anagrams)
    expect(found_anagrams).to match_array []
  end

  it 'returns an array of matches if words are not english' do
    non_english    = ["derpy", "jake2", "andrew5", "hola", "nd5wera"]
    found_anagrams = find_anagrams('5nawerd', non_english)
    expect(found_anagrams).to match_array ['andrew5', 'nd5wera']
  end

  it 'returns target if it is included in the array' do
    found_anagrams = find_anagrams('caret', possible_anagrams)
    expect(found_anagrams).to match_array ['caret', 'react', 'trace']
  end
end
