class CreateQuotesTable < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.references :deck, index: true
      t.string :content
    end
  end
end
