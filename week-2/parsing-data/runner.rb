require_relative 'person'
require_relative 'person_parser'
require 'time'

# Parse the data in the csv file into ruby objects
parser = PersonParser.new('people.csv')
people = parser.people

p people

# code from release 4
# person_hash = {
#     :first_name => "Jake",
#     :last_name => "Rapp",
#     :email => "jake.rapp322@gmail.edu",
#     :phone => "1-240-801-1084",
#     :created_at => "2016-06-21T07:16:40-07:00"
#     }

# jake = Person.new(person_hash)

# parser.save([jake])

# Get people with phone numbers in a certain area code
puts "The following people have phone numbers from area code 419."

people_with_area_code_419 = people.select { |person| /\A1-419/.match person.phone }
people_with_area_code_419.each { |person| puts "#{person.first_name} #{person.last_name}" }

puts "\nThe following people have emails ending in .edu"

people_with_edu_emails = people.select { |person| /edu$/.match(person.email)  }
people_with_edu_emails.each { |person| puts "#{person.first_name} #{person.last_name}" }

# Runner code

puts "Welcome to the most boring-est address book ever."

finished = false
people = []

until finished
  hash = {}

  puts "What is the person's first name?"
  hash[:first_name] = gets.chomp

  puts "What is the person's last name?"
  hash[:last_name] = gets.chomp

  puts "What is the person's email address?"
  hash[:email] = gets.chomp

  puts "What is the person's phone number?"
  hash[:phone] = gets.chomp

  now = Time.new.to_s
  hash[:created_at] = now

  people << Person.new(hash)

  puts "Would you like to add another person? Type EXIT if finished."
  another = gets.chomp
    another == "EXIT" ? finished = true : false
end

parser.save(people)
p parser.people


