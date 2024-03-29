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

ActiveRecord::Schema.define(version: 20151125185433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.integer  "guild_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "characters", ["guild_id"], name: "index_characters_on_guild_id", using: :btree

  create_table "characters_pets", id: false, force: :cascade do |t|
    t.integer "character_id"
    t.integer "pet_id"
  end

  add_index "characters_pets", ["character_id"], name: "index_characters_pets_on_character_id", using: :btree
  add_index "characters_pets", ["pet_id"], name: "index_characters_pets_on_pet_id", using: :btree

  create_table "guilds", force: :cascade do |t|
    t.string   "name"
    t.string   "realm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "rating"
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.integer  "creature_id"
    t.string   "family"
    t.boolean  "can_battle"
    t.text     "description"
    t.text     "source"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
