class AddRolAndExtraToSlides < ActiveRecord::Migration
  def self.up
    add_column :slides, :rol, :string, :length => 20
    add_column :slides, :body, :string, :length => 4096
    add_column :slides, :extra, :string, :length => 50

    Slide.all.each do |slide|
      slide.body = slide.text
      slide.rol = 'slide'
      slide.extra = ''
      slide.save
    end

    Card.all.each do |card|
      card.main_slide.update_attribute(:extra, 'main') if card.main_slide
      
      Slide.create(
        :card_id => card.id, :image_id => card.selection_image_id,
        :rol => 'selection', :body => card.selection_body,
        :extra => (card.selection_position == 0 ? 'top' : 'bottom'),
        :date =>  card.start) if card.selection_image_id
    end

  end

  def self.down
    Slide.all(:conditions => {:rol => 'selection'}).destroy_all
    remove_column :slides, :rol
    remove_column :slides, :body
    remove_column :slides, :extra
  end
end
