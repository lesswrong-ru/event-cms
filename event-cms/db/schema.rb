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

ActiveRecord::Schema.define(version: 20151006170901) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "visible",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "visible",     default: false
    t.date     "date"
    t.time     "start_time"
    t.time     "finish_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["start_time"], name: "index_sections_on_start_time", using: :btree

  create_table "speakers", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "speakers", ["name"], name: "index_speakers_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
