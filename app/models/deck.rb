class Deck < ActiveRecord::Base
  has_many :category_deck_links
  has_many :categories, through: :category_deck_links

  validates_presence_of :title, :author

  enum status: { free: 0, paid: 1 }

  after_initialize :set_status, if: :new_record?

  def set_status
    self.status ||= :paid
  end
end
