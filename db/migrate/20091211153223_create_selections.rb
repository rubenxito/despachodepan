class CreateSelections < ActiveRecord::Migration
  def self.up
    create_table :selections do |t|
      t.references :card
      t.text :position
      t.text :body
      t.boolean :active, :default => false
      t.references :image
      t.timestamps
    end
  end

  def self.down
    drop_table :selections
  end
end
