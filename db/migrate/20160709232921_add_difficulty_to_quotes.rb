class AddDifficultyToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :difficulty, :integer, index: true
  end
end
