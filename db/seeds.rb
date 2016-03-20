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

# Setup Decks with associated Categories and Guiding Quotes

5.times do |count|
  Category.create! name: Faker::Commerce.department(1)
end

10.times do |count|
  Deck.create! title: Faker::Book.title, subtitle: Faker::Lorem.sentence(3),
               author: Faker::Name.name, status: rand(0...Deck.statuses.count),
               tier: rand(0...Deck.tiers.count)

  2.times do
    category_id = rand(1..Category.count)
    unless Deck.last.categories.where(id: category_id).exists?
      Deck.last.categories << Category.find(category_id)
    end
  end

  3.times do
    Deck.last.quotes << Quote.new(content: Faker::Lorem.paragraph)
  end
end
