def find_anagrams(comparison, array)
  matching_array = []
  array.each { |word| matching_array << word if anagrams?(comparison, word) }
  matching_array
end

def anagrams?(first_str, second_str)
  anagram_canonical_form(first_str) == anagram_canonical_form(second_str) ? true : false
end

def anagram_canonical_form(word)
  word.downcase.chars.sort
end
