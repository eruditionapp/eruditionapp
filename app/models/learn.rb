class Learn

  MIN_CARDS = 3
  MAX_CARDS = 7

  def self.series user, deck
    difficulty = CurrentDifficulty.where(user_id: user.id).where(deck_id: deck.id).first_or_create difficulty: 1
    series = {}
    series['cards'] = []

    cards_in_range   = Card.due(user.id, deck.id).where(difficulty: difficulty).group_by(&:quote_id)
    card_group_index = cards_in_range.map { |g| g.second.length }.each_with_index.max[1]
    cards = cards_in_range.values[card_group_index]

    series['quote'] = cards.first.quote
    cards.take(MAX_CARDS).each do |card|
      series['cards'].push card.random_blank
    end
    series['card_index'] = 0
    
    series
  end
end
