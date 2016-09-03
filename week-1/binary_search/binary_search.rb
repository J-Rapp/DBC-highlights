def binary_search_include?(obj, array)
  return false if array.length == 0
  return true if array.length == 1

  first_array = []
  second_array = []

  halfway_point = array.length / 2

  # array[halfway_point] == obj ? return true ....

  first_array = array[0..halfway_point-1]
  second_array = array[halfway_point..array.length-1]

  # if obj > array[half]
    # return binary_search_include?(obj, second_array)
  # elsif < array[half]
    # return binary_search_include?(obj, second_array)
  # else

end

binary_search_include?("butt", [1, 2, 3, 4, 5, 6, 7, 8, 9])
