class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :quote

  validates_presence_of :card_type
  validates_presence_of :difficulty

  enum card_type: { flashcard:     0,
                    short_answer:  1,
                    organize:      2,
                    fill_in_blank: 3 }

  DIFFICULTY_LEVELS = {
    'one' => 1,
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9,
    'ten' => 10
  }

end
