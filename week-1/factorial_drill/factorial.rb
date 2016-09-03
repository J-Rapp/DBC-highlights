def factorial_iterative(n)
  return 1 if n == 0

  num = 1
  carry_over = 1
  counter = n - 1

  until counter == 0
    num += 1
    carry_over = num * carry_over
    counter -= 1
  end

  carry_over
end

def factorial_recursive(n)
  return 1 if n == 0
  return 1 if n == 1
  n * factorial_recursive(n - 1)
end
