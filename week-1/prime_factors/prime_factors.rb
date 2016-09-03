def prime_factors(number)
  return "Zero has no whole factors." if number == 0
  return "One is not a prime number." if number == 1

  prime_factor_array = block_given? ? yield : []
  range = (2..number-1)
  prime = range.find { |smallest_prime_factor| number % smallest_prime_factor == 0 }

  if prime
    prime_factor_array << prime
    remainder = number / prime
    prime_factors(remainder) { prime_factor_array }
  else prime == nil
    prime_factor_array << number
  end

end
