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

ActiveRecord::Schema.define(:version => 20111230180315) do

  create_table "components", :id => false, :force => true do |t|
    t.string   "name"
    t.string   "house_code"
    t.integer  "unit_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "components", ["name"], :name => "index_components_on_name", :unique => true

  create_table "lamps", :id => false, :force => true do |t|
    t.string   "name"
    t.string   "house_code", :limit => 1, :null => false
    t.integer  "unit_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lamps", ["name"], :name => "index_lamps_on_name", :unique => true

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["name"], :name => "index_rooms_on_name", :unique => true

end
