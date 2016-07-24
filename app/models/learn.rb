class Learn

  MIN_CARDS = 3
  MAX_CARDS = 5

  CARDS_NEEDED_TO_PASS = 2

  def self.series user, deck
    difficulty = get_difficulty user.id, deck.id
    cards      = get_cards difficulty, user.id, deck.id

    series               = {}
    series['cards']      = []
    series['quote']      = cards.first.quote
    series['difficulty'] = difficulty

    cards.take(MAX_CARDS).each do |card|
      series['cards'].push card.random_blank
    end

    series['card_index'] = 0
    series
  end

  def self.get_cards difficulty, user_id, deck_id
    cards_in_range   = Card.due(user_id, deck_id).where(difficulty: difficulty).group_by(&:quote_id)
    card_group_index = cards_in_range.map { |g| g.second.length }.each_with_index.max[1]
    cards_in_range.values[card_group_index]
  end

  def self.get_difficulty user_id, deck_id
    if !tmp = CurrentDifficulty.where(user_id: user_id).where(deck_id: deck_id).last.presence
      tmp = CurrentDifficulty.create user_id: user_id, deck_id: deck_id, difficulty: 1
    end
    get_valid_difficulty tmp.difficulty, user_id, deck_id
  end

  def self.get_valid_difficulty difficulty, user_id, deck_id
    if CARDS_NEEDED_TO_PASS <= Card.not_due(user_id, deck_id).where(difficulty: difficulty - 1).length
      difficulty
    else
      return 1 if difficulty < 1
      get_valid_difficulty difficulty - 1, user_id, deck_id
    end
  end
end
