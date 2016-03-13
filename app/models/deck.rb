class Deck < ActiveRecord::Base
  has_many :category_deck_links
  has_many :categories, through: :category_deck_links

end