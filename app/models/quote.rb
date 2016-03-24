class Quote < ActiveRecord::Base
  belongs_to :deck
  has_many :cards

  validates_presence_of :content

end
