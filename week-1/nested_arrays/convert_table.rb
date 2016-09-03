def convert_table(nested_array)
  one_person = []
  all_persons = []

  row_i = 1
  until row_i == nested_array.length
    column_i = 0
    until column_i == nested_array[row_i].length
      data_pair = [nested_array[0][column_i], nested_array[row_i][column_i]]
      one_person << data_pair
      column_i += 1
    end
  column_i = 0
  all_persons << Hash[one_person]
  one_person = []
  row_i += 1
end

all_persons
end
