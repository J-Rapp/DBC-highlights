require_relative('../pig_latin')

describe 'Converting single words to Pig Latin' do
  it 'checks for vowel' do
    expect(convert_word_to_pig_latin("elephant")).to eq("elephant")
  end

  it 'converts word with one consonant at beginning' do
    expect(convert_word_to_pig_latin("keyboard")).to eq("eyboardkay")
  end

  it 'converts word with two consonant at beginning' do
    expect(convert_word_to_pig_latin("chair")).to eq("airchay")
  end
end

describe 'Converting a sentence to Pig Latin' do
 it 'converts no punctuation sentence' do
  expect(convert_sentence_to_pig_latin("all lowercase no punctuation")).to eq("all owercaselay onay unctuationpay")
 end

 it 'converts sentence with punctuation' do
  expect(convert_sentence_to_pig_latin("all lowercase, with punctuation!")).to eq("all owercaselay, ithway unctuationpay!")
 end

 it 'converts contractions' do
    expect(convert_sentence_to_pig_latin("don't")).to eq("on'tday")
  end

   it 'converts sentence with quotations' do
  expect(convert_sentence_to_pig_latin("all lowercase, \"with\" punctuation!")).to eq("all owercaselay, \"ithway\" unctuationpay!")
 end

end

#-----will need to address capitalization----
  #  it 'converts capitalization' do
  #   expect(convert_sentence_to_pig_latin("don't")).to eq("ont'day")
  # end

  #integers?
