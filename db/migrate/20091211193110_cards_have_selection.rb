class CardsHaveSelection < ActiveRecord::Migration
  def self.up
    add_column :cards, :selected, :boolean, :default => false
    add_column :cards, :selection_image_id, :integer
    add_column :cards, :selection_body, :string, :length => 4096
    add_column :cards, :selection_position, :integer, :default => 0
  end

  def self.down
    remove_column :cards, :selected
    remove_column :cards, :selection_image_id
    remove_column :cards, :selection_body
    remove_column :cards, :selection_position
  end
end
