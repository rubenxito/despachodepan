class Legacy < ActiveRecord::Migration
  def self.up
    create_table "card_images", :force => true do |t|
      t.column "card_id",  :integer
      t.column "image_id", :integer
      t.column "text",     :string
      t.column "pos", :integer
      t.column "date", :string
    end

    create_table "colors", :force => true do |t|
      t.column "name", :string
      t.column "value", :string
      t.column "high_value", :string
    end

    create_table "tags", :force => true do |t|
      t.column "name", :string
      t.column "position", :integer
      t.column "color_id", :integer
    end

    create_table "cards_tags", :force => true, :id => false do |t|
      t.column "card_id",  :integer
      t.column "tag_id", :integer
    end

    create_table "card_files", :force => true do |t|
      t.column "parent_id",    :integer
      t.column "content_type", :string
      t.column "filename",     :string
      t.column "size",         :integer
      t.column "card_id", :integer
      t.column "title", :string
    end

    create_table "cards", :force => true do |t|
      t.column "title",         :string
      t.column "text",          :string,  :limit => 4096
      t.column "properties",    :string,  :limit => 1024
      t.column "main_image_id", :integer
      t.column "vposition", :integer
      t.column "start", :string
      t.column "finish", :string
      t.column "color_id", :string
      t.column "visible", :boolean
      t.column "main_slide_id", :integer
      t.column "main_file_id", :integer
      t.column "link", :string
      t.column "created_at", :datetime
      t.column "updated_at", :datetime
    end

    create_table "images", :force => true do |t|
      t.column "parent_id",    :integer
      t.column "content_type", :string
      t.column "filename",     :string
      t.column "thumbnail",    :string
      t.column "size",         :integer
      t.column "width",        :integer
      t.column "height",       :integer
    end

    create_table "users", :force => true do |t|
      t.column "login",                     :string
      t.column "email",                     :string
      t.column "crypted_password",          :string,   :limit => 40
      t.column "salt",                      :string,   :limit => 40
      t.column "created_at",                :datetime
      t.column "updated_at",                :datetime
      t.column "remember_token",            :string
      t.column "remember_token_expires_at", :datetime
    end
  end

  def self.down
    drop_database :card_images
    drop_database :colors
    drop_database :tags
    drop_database :cards_tags
    drop_database :cards_files
    drop_database :cards
    drop_database :images
    drop_database :users
  end
end
