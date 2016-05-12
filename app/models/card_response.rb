class CardResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :quote
  belongs_to :deck
  belongs_to :card

  DUE_DATE = {
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
  # CardResponse::DUE_DATE[1].call #=> Thu, 12 May 2016 06:32:12 UTC +00:00

end
