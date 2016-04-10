class AddTimestampsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :created_at, :datetime
    add_column :cards, :updated_at, :datetime
  end
end
