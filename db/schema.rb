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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150922094740) do

  create_table "auctions", force: true do |t|
    t.datetime "endtime"
    t.integer  "bike_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auctions", ["bike_id"], name: "index_auctions_on_bike_id"

  create_table "bids", force: true do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "auction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bikes", force: true do |t|
    t.text     "name"
    t.text     "color"
    t.integer  "weight"
    t.text     "batterytype"
    t.integer  "kwh"
    t.integer  "maxspeed"
    t.text     "brand"
    t.integer  "chargingtime"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bikes", ["owner_id"], name: "index_bikes_on_owner_id"

  create_table "users", force: true do |t|
    t.text     "username"
    t.text     "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
