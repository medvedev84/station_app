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

ActiveRecord::Schema.define(:version => 20121222131019) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prices", :force => true do |t|
    t.integer  "region_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "price_dt"
    t.string   "price_80"
    t.string   "price_92"
    t.string   "price_95"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stations", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
