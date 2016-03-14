class AddStatusToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :status, :integer
  end
end
