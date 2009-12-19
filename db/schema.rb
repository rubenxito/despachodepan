# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091215150812) do

  create_table "card_files", :force => true do |t|
    t.integer "parent_id"
    t.string  "content_type"
    t.string  "filename"
    t.integer "size"
    t.integer "card_id"
    t.string  "title"
  end

  create_table "card_images", :force => true do |t|
    t.integer "card_id"
    t.integer "image_id"
    t.string  "text"
    t.integer "pos"
    t.string  "date"
  end

  create_table "cards", :force => true do |t|
    t.string   "title"
    t.string   "text",               :limit => 4096
    t.string   "properties",         :limit => 1024
    t.integer  "main_image_id"
    t.integer  "vposition"
    t.string   "start"
    t.string   "finish"
    t.string   "color_id"
    t.boolean  "visible"
    t.integer  "main_slide_id"
    t.integer  "main_file_id"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "slides_count",                       :default => 0
    t.boolean  "selected",                           :default => false
    t.integer  "selection_image_id"
    t.string   "selection_body"
    t.integer  "selection_position",                 :default => 0
  end

  add_index "cards", ["title"], :name => "index_cards_on_title"
  add_index "cards", ["updated_at"], :name => "index_cards_on_updated_at"

  create_table "cards_tags", :id => false, :force => true do |t|
    t.integer "card_id"
    t.integer "tag_id"
  end

  create_table "colors", :force => true do |t|
    t.string "name"
    t.string "value"
    t.string "high_value"
  end

  create_table "images", :force => true do |t|
    t.integer "parent_id"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
  end

  create_table "selections", :force => true do |t|
    t.integer  "card_id"
    t.text     "position"
    t.text     "body"
    t.boolean  "active",     :default => false
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slides", :force => true do |t|
    t.integer "card_id"
    t.integer "image_id"
    t.string  "text"
    t.integer "pos"
    t.string  "date"
    t.string  "rol"
    t.string  "body"
    t.string  "extra"
  end

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "position"
    t.integer "color_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
