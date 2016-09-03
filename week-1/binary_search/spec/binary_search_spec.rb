require_relative '../binary_search'

describe 'binary_search_include?' do
let (:symbols) { [:A, :B, :C, :D] }
let (:one) { ["butt"] }
let (:empty) { [] }

  context 'searches an array' do
    it 'finds the element in the array' do
      expect(binary_search_include?(:B, symbols)).to eq true
    end

    it 'doesn\'t find the object in the array' do
      expect(binary_search_include?(:X, symbols)). to eq false
    end

    it 'the array is empty' do
      expect(binary_search_include?("butt", empty)).to eq false
    end

    it 'array contains one element' do
      expect(binary_search_include?("butt", one)).to eq true
    end

    # two elements, other edge cases?
  end

end

describe 'binary_search' do
end
