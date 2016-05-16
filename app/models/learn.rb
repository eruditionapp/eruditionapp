class Learn

  def self.series user, deck
    series = {}

    series[:quote] = deck.quotes.first
    series[:cards] = series[:quote].cards.limit(5).to_a
    
    series
  end
end
