class CategoryDeckLink < ActiveRecord::Base
  belongs_to :deck
  belongs_to :category

  validates_uniqueness_of :deck_id, :scope => :category_id
end