class AddRolAndExtraToSlides < ActiveRecord::Migration
  def self.up
    add_column :slides, :rol, :string, :length => 20
    add_column :slides, :body, :string, :length => 4096
    add_column :slides, :extra, :string, :length => 50

    Slide.all.each do |slide|
      slide.body = slide.text
      slide.rol = 'slide'
      slide.extra = ''
      slide.save!
    end

    Card.all.each do |card|
      card.main_slide.update_attribute(:extra, 'main') if card.main_slide
    end

  end

  def self.down
    remove_column :slides, :rol
    remove_column :slides, :body
    remove_column :slides, :extra
  end
end
