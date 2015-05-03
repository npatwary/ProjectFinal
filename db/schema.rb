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

ActiveRecord::Schema.define(version: 20150502232306) do

  create_table "ability_scores", force: :cascade do |t|
    t.string   "name"
    t.integer  "score",              default: 1
    t.integer  "modifier",           default: 1
    t.integer  "playercharacter_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
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
    t.integer  "cost"
    t.string   "unit"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "armor_and_shields", ["playercharacter_id"], name: "index_armor_and_shields_on_playercharacter_id"

  create_table "attack_weapons", force: :cascade do |t|
    t.integer  "playercharacter_id"
    t.string   "name"
    t.integer  "attackBonus"
    t.string   "damage"
    t.string   "typeDnD"
    t.integer  "cost"
    t.string   "unit"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "attack_weapons", ["playercharacter_id"], name: "index_attack_weapons_on_playercharacter_id"

  create_table "cantrips", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "playercharacter_id"
  end

  add_index "cantrips", ["playercharacter_id"], name: "index_cantrips_on_playercharacter_id"

  create_table "equipment", force: :cascade do |t|
    t.integer  "playercharacter_id"
    t.string   "name"
    t.string   "description"
    t.integer  "cost"
    t.string   "unit"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "equipment", ["playercharacter_id"], name: "index_equipment_on_playercharacter_id"

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

  create_table "hide_attributes_tables", force: :cascade do |t|
    t.integer  "pc_id"
    t.boolean  "ability_reveal"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "skill_reveal"
    t.boolean  "savingthrow_reveal"
    t.boolean  "personality_reveal"
    t.boolean  "attribute_reveal"
    t.boolean  "characterbonus_reveal"
    t.boolean  "wealth_reveal"
    t.boolean  "physicalfeature_reveal"
    t.boolean  "carry_reveal"
    t.boolean  "spellcast_reveal"
    t.boolean  "attackweapon_reveal"
    t.boolean  "spell_reveal"
    t.boolean  "armorshield_reveal"
    t.boolean  "attackdescription_reveal"
    t.boolean  "equipment_reveal"
    t.boolean  "characterdescription_reveal"
    t.boolean  "alliesandorganisation_reveal"
    t.boolean  "additionalfeature_reveal"
    t.boolean  "treasure_reveal"
  end

  create_table "invited_games_models", force: :cascade do |t|
    t.string   "name"
    t.string   "dungeonMaster"
    t.string   "passKey"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "player_character_classes", force: :cascade do |t|
    t.string   "name"
    t.string   "hitDice"
    t.integer  "currentHitPoint"
    t.string   "maximumHitPoint"
    t.text     "armorProficiency"
    t.text     "weaponProficiency"
    t.text     "toolsProfiency"
    t.text     "savingThroughs",        default: "--- []\n"
    t.text     "proficientSkills",      default: "--- []\n"
    t.text     "equipment",             default: "--- []\n"
    t.integer  "numberOfAllowedSkills"
    t.integer  "spellcastAbility"
    t.integer  "spellSaveDC"
    t.integer  "spellAttackBonus"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "player_characters", force: :cascade do |t|
    t.boolean  "isUsed"
    t.string   "name"
    t.string   "classDnD"
    t.integer  "level",                          default: 1
    t.string   "background"
    t.string   "race"
    t.string   "alignment"
    t.integer  "experiencePoints",               default: 0
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
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "creator_id"
    t.integer  "game_id"
  end

  add_index "player_characters", ["creator_id"], name: "index_player_characters_on_creator_id"
  add_index "player_characters", ["game_id"], name: "index_player_characters_on_game_id"

  create_table "races", force: :cascade do |t|
    t.string   "name"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "constitution"
    t.integer  "intelligence"
    t.integer  "wisdom"
    t.integer  "charisma"
    t.integer  "base_speed"
    t.integer  "max_age"
    t.string   "alignment"
    t.string   "language"
    t.string   "tools"
    t.string   "features"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "saving_throughs_table_for_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saving_throws", force: :cascade do |t|
    t.integer  "playercharacter_id"
    t.string   "name"
    t.boolean  "proficient"
    t.integer  "modifier",           default: 1
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "saving_throws", ["playercharacter_id"], name: "index_saving_throws_on_playercharacter_id"

  create_table "skills", force: :cascade do |t|
    t.integer  "playercharacter_id"
    t.string   "name"
    t.boolean  "proficient"
    t.integer  "modifier",           default: 1
    t.string   "ability"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "skills", ["playercharacter_id"], name: "index_skills_on_playercharacter_id"

  create_table "skills_table_for_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "player_character_id"
  end

  add_index "spells", ["player_character_id"], name: "index_spells_on_player_character_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true

  create_table "wealths", force: :cascade do |t|
    t.integer  "playercharacter_id"
    t.integer  "copper",             default: 0
    t.integer  "silver",             default: 0
    t.integer  "electrum",           default: 0
    t.integer  "gold",               default: 0
    t.integer  "platinum",           default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "wealths", ["playercharacter_id"], name: "index_wealths_on_playercharacter_id"

end
