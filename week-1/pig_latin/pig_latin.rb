def convert_word_to_pig_latin(word)
  if (word =~ /[aeiou]/) == 0
    word
  else
    array = word.partition(/[bcdfghjklmnpqrstvwxyz]+/)
    array[3] = array[2].slice!(/\W+\z/)
    array.pop if array[3] == nil
    array[1], array[2] = array[2], array[1]
    array.insert(3,"ay")
    flipped = array.join
  end
end

def convert_sentence_to_pig_latin(sentence)
  sentence_array = sentence.split(' ')
  complete_sentence = []

  for word in sentence_array
     complete_sentence << convert_word_to_pig_latin(word)
  end

  complete_sentence.join(' ')
end
