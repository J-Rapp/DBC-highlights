require_relative '../person'
require 'date'

describe Person do
  person_hash = {
    :first_name => "Lani",
    :last_name => "Rollins",
    :email => "blandit@quam.com",
    :phone => "1-419-389-7173",
    :created_at => "2012-05-10T03:53:40-07:00"
  }
  let(:person) { Person.new(person_hash) }

  it 'has readable attributes' do
    expect(person.first_name).to eq "Lani"
    expect(person.last_name).to eq "Rollins"
    expect(person.email).to eq "blandit@quam.com"
    expect(person.phone).to eq "1-419-389-7173"
    expect(person.created_at).to be_instance_of(DateTime)
  end
end
