puts 'Begin seeding database..'
start = Time.now

# Seed Users

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

# Seed Decks, Categories, Guiding Quotes, and Cards

5.times do |count|
  Category.create! name: Faker::Commerce.department(1)
end

12.times do |count|
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

  quotes = Quote.where(deck_id: Deck.last.id).map &:id
  content = 'The *first* man to walk on the moon was *Neil Armstrong*.'
  
  100.times do
    Deck.last.cards << Card.new(card_type: 2, difficulty: rand(1..10), content: content,
                                status: rand(0...Card.statuses.count))
    
    quote = Quote.find(quotes[rand(0...quotes.length)])
    quote.cards << Card.last
  end
end

# Seed Card Responses

User.find_each do |user|
  value = [
    true,true,true,true,true,
    true,true,true,true,true,
    false
  ]

  3.times do
    deck = Deck.find(rand(1..Deck.count))
    quotes = deck.quotes.map &:id

    5.times do
      quote = Quote.find(quotes.sample)
      cards = quote.cards.limit(10)

      cards.each do |card|
        CardResponse.create response_was_correct: value.sample, user_id: user.id,
          quote_id: quote.id, deck_id: deck.id, card_id: card.id
      end
    end
  end
end

puts "Finished seeding after #{Time.now - start} seconds"
