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

ActiveRecord::Schema.define(:version => 20140809170131) do

  create_table "admin_sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "admin_sessions", ["session_id"], :name => "index_admin_sessions_on_session_id"
  add_index "admin_sessions", ["updated_at"], :name => "index_admin_sessions_on_updated_at"

  create_table "admins", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",                    :null => false
    t.string   "password_salt",                       :null => false
    t.string   "persistence_token",                   :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "single_access_token", :default => "", :null => false
    t.string   "perishable_token",    :default => "", :null => false
    t.integer  "login_count",         :default => 0,  :null => false
    t.integer  "failed_login_count",  :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
  end

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
    t.integer  "litter_id"
    t.string   "status"
  end

  create_table "photos", :force => true do |t|
    t.string   "image"
    t.string   "caption"
    t.integer  "pet_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photos", ["pet_id"], :name => "index_photos_on_pet_id"

  create_table "settings", :force => true do |t|
    t.string   "var",                      :null => false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", :limit => 30
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], :name => "index_settings_on_thing_type_and_thing_id_and_var", :unique => true

  create_table "static_pages", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

end
