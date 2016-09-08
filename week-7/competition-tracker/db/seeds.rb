Match.delete_all
Competitor.delete_all
League.delete_all
User.delete_all

league1 = League.create(name: 'League A')
league2 = League.create(name: 'League B')

6.times do
  league1.competitors.create({
    :name => Faker::Name.name,
  })
end

6.times do
  league2.competitors.create({
    :name => Faker::Name.name,
  })
end

# 10.times do
#   match = league1.matches.new
#   match.round_number = rand(4)
#   match.competitors = league1.competitors.sample(2)
#   match.winner_id = match.competitors[0].id
#   match.loser_id = match.competitors[1].id
#   match.save
# end

# 10.times do
#   match = league2.matches.new
#   match.round_number = rand(4)
#   match.competitors = league2.competitors.sample(2)
#   match.winner_id = match.competitors[0].id
#   match.loser_id = match.competitors[1].id
#   match.save
# end

User.create(username: "admin", password: "secret")

