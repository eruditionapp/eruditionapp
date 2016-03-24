class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :card_type, index: true
      t.integer :difficulty, index: true
      t.references :deck, index: true
      t.references :quote, index: true
      t.jsonb :content, default: {}
    end
  end
end
