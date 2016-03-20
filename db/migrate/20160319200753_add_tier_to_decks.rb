class AddTierToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :tier, :integer
  end
end
