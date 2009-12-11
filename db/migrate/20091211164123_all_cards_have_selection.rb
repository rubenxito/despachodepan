class AllCardsHaveSelection < ActiveRecord::Migration
  def self.up
    Card.all.each do |card|
      card.create_selection
    end
  end

  def self.down
  end
end
