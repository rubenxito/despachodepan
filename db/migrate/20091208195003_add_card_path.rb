class AddCardPath < ActiveRecord::Migration
  def self.up
    add_column :cards, :url, :string
    add_column :cards, :slides_count, :integer, :default => 0

    Card.record_timestamps=false
    Card.all.each do |card|
      Card.update_counters card.id, :slides_count => card.slides.length
      card.save
    end
  end

  def self.down
    remove_column :cards, :url
  end
end
