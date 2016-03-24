class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :quote

  validates_presence_of :card_type
  validates_presence_of :difficulty

  enum card_type: { flashcard:     0,
                    short_answer:  1,
                    organize:      2,
                    fill_in_blank: 3 }

end
