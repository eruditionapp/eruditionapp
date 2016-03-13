# Setup one user per role

[ {email: 'superadmin@test.com', password: 'password', role: 4},
  {email: 'admin@test.com',      password: 'password', role: 3},
  {email: 'overdue@test.com',    password: 'password', role: 2},
  {email: 'paid@test.com',       password: 'password', role: 1},
  {email: 'free@test.com',       password: 'password', role: 0}
].each do |attributes|
  user = User.new attributes
  user.skip_confirmation!
  user.save!
end

# Setup Decks with associated Categories

5.times do |count|
  Category.create! name: "Category #{count + 1}"
end

10.times do |count|
  Deck.create! title: "Deck #{count + 1}", subtitle: "Subtitle #{count + 1}",
               author: "Author #{count + 1}"
  Deck.last.categories << Category.find(rand(1...Category.count))
end