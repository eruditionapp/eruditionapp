class Category < ActiveRecord::Base
  has_many :category_deck_links
  has_many :decks, through: :category_deck_links

  scope :filter_decks , -> category { where(name: category).first.decks }

end