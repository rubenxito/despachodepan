class AddCardPath < ActiveRecord::Migration
  def self.up
    #add_column :cards, :url, :string
    Card.all.each do |card|
      card.save
    end
  end

  def self.down
    remove_column :cards, :url
  end
end
