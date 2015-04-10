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


ActiveRecord::Schema.define(version: 20150408181447) do

  create_table "ability_scores", force: :cascade do |t|
    t.string   "name"
    t.integer  "score"
    t.integer  "modifier"
    t.integer  "playercharacter_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "ability_scores", ["playercharacter_id"], name: "index_ability_scores_on_playercharacter_id"

  create_table "allies_and_organizations", force: :cascade do |t|
    t.integer  "playercharacter_id"
    t.string   "name"
    t.string   "description"
    t.string   "symbolDnD"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "allies_and_organizations", ["playercharacter_id"], name: "index_allies_and_organizations_on_playercharacter_id"

  create_table "armor_and_shields", force: :cascade do |t|
    t.integer  "playercharacter_id"
    t.string   "name"
    t.string   "disadvantage"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "armor_and_shields", ["playercharacter_id"], name: "index_armor_and_shields_on_playercharacter_id"

  create_table "attack_weapons", force: :cascade do |t|
    t.integer  "playercharacter_id"
    t.string   "name"
    t.integer  "attackBonus"
    t.string   "damage"
    t.string   "type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "attack_weapons", ["playercharacter_id"], name: "index_attack_weapons_on_playercharacter_id"

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

  create_table "invited_games_models", force: :cascade do |t|
    t.string   "name"
    t.string   "dungeonMaster"
    t.string   "passKey"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "player_characters", force: :cascade do |t|
    t.boolean  "isUsed"
    t.string   "name"
    t.string   "classDnD"
    t.integer  "level"
    t.string   "background"
    t.string   "race"
    t.string   "alignment"
    t.integer  "experiencePoints"
    t.string   "inspiration"
    t.integer  "proficiencyBonus"
    t.integer  "armorClass"
    t.integer  "initiative"
    t.integer  "speed"
    t.integer  "currentHitPoints"
    t.integer  "maxHitPoints"
    t.integer  "temporaryHitPoints"
    t.string   "totalHitDice"
    t.string   "hitDice"
    t.integer  "deathSaveSuccesses"
    t.integer  "deathSaveFailures"
    t.string   "personalityTraits"
    t.string   "ideals"
    t.string   "bonds"
    t.string   "flaws"
    t.string   "attacksDescription"
    t.string   "passiveWisdom"
    t.string   "otherProficienciesAndLanguages"
    t.integer  "maxEquipmentCarryCapacity"
    t.integer  "currentEquipmentCarryCapacity"
    t.string   "featuresAndTraits"
    t.integer  "age"
    t.string   "height"
    t.string   "weight"
    t.string   "eyes"
    t.string   "skin"
    t.string   "hair"
    t.string   "characterAppearance"
    t.string   "characterBackstory"
    t.string   "additionalFeaturesAndTraits"
    t.string   "treasure"
    t.string   "spellCastingAbility"
    t.string   "spellSaveDC"
    t.string   "spellAttackBonus"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "creator_id"
    t.integer  "game_id"
  end

  add_index "player_characters", ["creator_id"], name: "index_player_characters_on_creator_id"
  add_index "player_characters", ["game_id"], name: "index_player_characters_on_game_id"

  create_table "saving_throws", force: :cascade do |t|
    t.integer  "playercharacter_id"
    t.string   "name"
    t.boolean  "proficient"
    t.integer  "modifier"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "saving_throws", ["playercharacter_id"], name: "index_saving_throws_on_playercharacter_id"

  create_table "skills", force: :cascade do |t|
    t.integer  "playercharacter_id"
    t.string   "name"
    t.boolean  "proficient"
    t.integer  "modifier"
    t.string   "ability"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "skills", ["playercharacter_id"], name: "index_skills_on_playercharacter_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "wealths", force: :cascade do |t|
    t.integer  "playercharacter_id"
    t.integer  "copper"
    t.integer  "silver"
    t.integer  "electrum"
    t.integer  "gold"
    t.integer  "platinum"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "wealths", ["playercharacter_id"], name: "index_wealths_on_playercharacter_id"

end
