# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140317214617) do

  create_table "litters", :force => true do |t|
    t.string   "birth_date"
    t.integer  "mother_id"
    t.integer  "father_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "litters", ["mother_id", "birth_date"], :name => "index_litters_on_mother_id_and_birth_date"

  create_table "pets", :force => true do |t|
    t.string   "name"
    t.date     "birth_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "profile_picture"
    t.string   "gender"
    t.string   "color"
    t.string   "eye_color"
    t.string   "breed"
    t.float    "height"
    t.float    "weight"
    t.text     "description"
  end

  create_table "photos", :force => true do |t|
    t.string   "image"
    t.string   "caption"
    t.integer  "pet_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photos", ["pet_id"], :name => "index_photos_on_pet_id"

end
