class SlideReverseDate < ActiveRecord::Migration
  def self.up
    add_column :slides, :rev_date, :string, :length => 10

    Slide.all.each {|slide| slide.save }
  end

  def self.down
    remove_column :slides, :rev_date
  end
end
