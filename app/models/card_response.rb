class CardResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :quote
  belongs_to :deck
  belongs_to :card

  # validates_presence_of :card_due_key, :card_due_value

  CARD_DUE = {
    0  => -> { Time.now },
    1  => -> { 1.hours.from_now },
    2  => -> { 1.days.from_now  },
    3  => -> { 2.days.from_now  },
    4  => -> { 4.days.from_now  },
    5  => -> { 8.days.from_now  },
    6  => -> { 16.days.from_now },
    7  => -> { 1.months.from_now },
    8  => -> { 2.months.from_now },
    9  => -> { 4.months.from_now },
    10 => -> { 8.months.from_now },
  }

  before_save :set_card_due
  def set_card_due
    if last_key = CardResponse.where(user: user.id, card: card.id).last.try(:card_due_key)
      case response_was_correct
      when true
        self.card_due_key   = last_key == CARD_DUE.keys.last ? last_key : last_key + 1
        self.card_due_value = CARD_DUE[card_due_key].call
      when false
        self.card_due_key   = 0
        self.card_due_value = CARD_DUE[card_due_key].call
      end
    else
      handle_first_response
    end
  end

  def handle_first_response
    case response_was_correct
    when true
      self.card_due_key   = 1
      self.card_due_value = CARD_DUE[card_due_key].call
    when false
      self.card_due_key   = 0
      self.card_due_value = CARD_DUE[card_due_key].call
    end
  end

end
