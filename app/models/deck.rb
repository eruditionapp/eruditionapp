class Deck < ActiveRecord::Base
  has_many :category_deck_links
  has_many :categories, through: :category_deck_links
  has_many :quotes
  has_many :cards
  has_many :card_responses
  has_many :users, through: :card_responses
  has_many :users, through: :current_difficulty

  validates_presence_of :title, :author

  after_initialize :set_tier, if: :new_record?
  after_initialize :set_status, if: :new_record?

  scope :scope_status, -> status { where(status: status) }
  scope :scope_tier,   -> tier   { where(tier: tier) }

  enum tier:   { free: 0,
                 paid: 1 }

  enum status: { published:   0,
                 unpublished: 1 }

  def set_tier
    self.tier ||= :paid
  end

  def set_status
    self.status ||= :unpublished
  end
end
