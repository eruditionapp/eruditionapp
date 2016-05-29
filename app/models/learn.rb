class Learn

  def self.series user, deck
    series = {}
    series['cards'] = []

    series['quote'] = deck.quotes.first
    series['quote'].cards.limit(5).each do |card|
      series['cards'].push card.random_blank
    end
    series['card_index'] = 0
    
    series
  end
end
