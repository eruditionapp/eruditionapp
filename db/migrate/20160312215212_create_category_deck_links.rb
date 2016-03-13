class CreateCategoryDeckLinks < ActiveRecord::Migration
  def change
    create_table :category_deck_links do |t|
      t.belongs_to :deck, index: true
      t.belongs_to :category, index: true
    end

    add_index :category_deck_links, [:category_id, :deck_id], unique: true
  end
end
