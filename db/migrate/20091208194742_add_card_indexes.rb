class AddCardIndexes < ActiveRecord::Migration
  def self.up
    add_index :cards, :title
    add_index :cards, :updated_at
  end

  def self.down
  end
end
