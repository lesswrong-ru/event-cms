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

ActiveRecord::Schema.define(version: 20151006185859) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "visible",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_sections", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "section_id"
  end

  add_index "events_sections", ["event_id", "section_id"], name: "index_events_sections_on_event_id_and_section_id", using: :btree

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

  create_table "sections_speakers", id: false, force: true do |t|
    t.integer "section_id"
    t.integer "speaker_id"
  end

  add_index "sections_speakers", ["section_id", "speaker_id"], name: "index_sections_speakers_on_section_id_and_speaker_id", using: :btree

  create_table "sections_tags", id: false, force: true do |t|
    t.integer "section_id"
    t.integer "tag_id"
  end

  add_index "sections_tags", ["section_id", "tag_id"], name: "index_sections_tags_on_section_id_and_tag_id", using: :btree

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
