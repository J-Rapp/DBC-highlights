require_relative '../person_parser'
require_relative '../person'

describe PersonParser do
  person_parser = PersonParser.new('./people.csv')

  it 'returns an array of Person instance' do
    expect(person_parser.people).to be_an Array
  end

  it 'is writable' do
    person_hash = {
    :first_name => "Jake",
    :last_name => "Rapp",
    :email => "jake.rapp322@gmail.com",
    :phone => "1-240-801-1084",
    :created_at => "2016-06-21T07:16:40-07:00"
    }
    jake = Person.new(person_hash)
    person_parser.save([jake])

    expect(person_parser.people.pop).to be_instance_of Person
  end

end
