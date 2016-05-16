class Quote < ActiveRecord::Base
  belongs_to :deck
  has_many :cards
  has_many :card_responses
  has_many :users, through: :card_responses

  validates_presence_of :content

end
