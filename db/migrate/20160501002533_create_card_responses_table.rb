class CreateCardResponsesTable < ActiveRecord::Migration
  def change
    create_table :card_responses do |t|
      t.integer :card_due_key, null: false
      t.datetime :card_due_value
      t.boolean :response_was_correct, null: false
      t.references :user, null: false, index: true
      t.references :quote, null: false, index: true
      t.references :deck, null: false, index: true
      t.references :card, null: false, index: true
      t.timestamps
    end
  end
end
