def convert_to_roman(arabic_number, options = {})
  roman_numerals = ''
  remainder = arabic_number
  things_to_figure = [1000, 500, 100, 50, 10, 5, 1]
  figured_things = ['M', 'D', 'C', 'L', 'X', 'V', 'I']
  i = 0
  letters = 0
  while i <= 6
      if arabic_number >= things_to_figure[i]
        remainder = arabic_number % things_to_figure[i]
        arabic_number = arabic_number - remainder
        letters = arabic_number/things_to_figure[i]
        letters.times {|n| roman_numerals = roman_numerals + "#{figured_things[i]}"}
        arabic_number = remainder
        i += 1
      else
        i += 1
      end
    end
  if options[:modern] == true
    fours_nines_old = ["DCCCC", "LXXXX", "VIIII", "CCCC", "XXXX", "IIII"]
    fours_nines_new = ["CM", "XC", "IX", "CD", "XL", "IV"]
    fours_nines_old.each_index do |i|
      roman_numerals = roman_numerals.gsub(fours_nines_old[i], fours_nines_new[i])
    end
  end
  return roman_numerals
end

