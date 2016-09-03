require 'csv'

csv = CSV.open('todo_list_data.csv', "a+", headers: true)


case ARGV[0]
when "list"
  csv.to_a.each { | todo | puts "- #{todo["item_description"]}" }
when "add"
  csv << [ARGV[1]]
  puts "Appended \"#{ARGV[1]}\" to the list"
when "remove"
  array = csv.to_a.delete_if do | todo_item |
    todo_item.to_s.include? "#{ARGV[1]}"
  end
  CSV.open('todo_list_data.csv', "w") do | csv |
    csv << ["item_description"]
    array.each do | row |
      csv << [row["item_description"]]
    end
  end
  puts "Removed items pertaining to \"#{ARGV[0]}\" from the list."
end


