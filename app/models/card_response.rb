class CardResponse < ActiveRecord::Base

  belongs_to :user
  belongs_to :quote
  belongs_to :deck
  belongs_to :card
end
