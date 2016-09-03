def iterative_nth_fibonacci_number(n)
  return 0 if n == 0
  return 1 if n == 1
  index = 2
  fib = 1
  b1 = 1
  b2 = 0
  until index == n
    b2 = b1
    b1 = fib
    fib = b1 + b2
    index += 1
  end
  fib
end

def recursive_nth_fibonacci_number(n)
  return 0 if n == 0
  return 1 if n == 1
  return recursive_nth_fibonacci_number(n-1) + recursive_nth_fibonacci_number(n-2)
end
