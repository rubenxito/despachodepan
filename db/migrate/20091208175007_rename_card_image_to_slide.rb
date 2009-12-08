class RenameCardImageToSlide < ActiveRecord::Migration
  def self.up
    rename_table :card_images, :slides
  end

  def self.down
    rename_table :slides, :card_images
  end
end
