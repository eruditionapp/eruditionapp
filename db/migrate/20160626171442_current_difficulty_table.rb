class CurrentDifficultyTable < ActiveRecord::Migration
  def change
    create_table :current_difficulties do |t|
      t.integer :difficulty, null: false
      t.references :user, null: false, index: true
      t.references :deck, null: false, index: true
      t.timestamps
    end
  end
end
