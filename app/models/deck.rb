class Deck < ActiveRecord::Base
  has_many :category_deck_links
  has_many :categories, through: :category_deck_links
  has_many :quotes

  validates_presence_of :title, :author

  enum tier:   { free: 0, paid: 1 }
  enum status: { published: 0, unpublished: 1 }

  after_initialize :set_tier, if: :new_record?
  after_initialize :set_status, if: :new_record?

  def set_tier
    self.tier ||= :paid
  end

  def set_status
    self.status ||= :unpublished
  end
end
