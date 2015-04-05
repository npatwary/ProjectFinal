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

ActiveRecord::Schema.define(version: 20150405181744) do

  create_table "game_invitations", force: :cascade do |t|
    t.string   "game_password"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "game_id"
    t.integer  "dungeon_master_id"
    t.integer  "user_player_id"
  end

  add_index "game_invitations", ["dungeon_master_id"], name: "index_game_invitations_on_dungeon_master_id"
  add_index "game_invitations", ["game_id"], name: "index_game_invitations_on_game_id"
  add_index "game_invitations", ["user_player_id"], name: "index_game_invitations_on_user_player_id"

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.string   "map"
    t.text     "game_history"
    t.string   "game_password"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "games", ["name"], name: "index_games_on_name", unique: true
  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true

end
