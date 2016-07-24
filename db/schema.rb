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

ActiveRecord::Schema.define(version: 20160626171442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_responses", force: :cascade do |t|
    t.integer  "card_due_key",         null: false
    t.datetime "card_due_value"
    t.boolean  "response_was_correct", null: false
    t.integer  "user_id",              null: false
    t.integer  "quote_id",             null: false
    t.integer  "deck_id",              null: false
    t.integer  "card_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_responses", ["card_id"], name: "index_card_responses_on_card_id", using: :btree
  add_index "card_responses", ["deck_id"], name: "index_card_responses_on_deck_id", using: :btree
  add_index "card_responses", ["quote_id"], name: "index_card_responses_on_quote_id", using: :btree
  add_index "card_responses", ["user_id"], name: "index_card_responses_on_user_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.integer  "card_type"
    t.integer  "difficulty"
    t.integer  "deck_id"
    t.integer  "quote_id"
    t.string   "content"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["card_type"], name: "index_cards_on_card_type", using: :btree
  add_index "cards", ["deck_id"], name: "index_cards_on_deck_id", using: :btree
  add_index "cards", ["difficulty"], name: "index_cards_on_difficulty", using: :btree
  add_index "cards", ["quote_id"], name: "index_cards_on_quote_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "category_deck_links", force: :cascade do |t|
    t.integer "deck_id"
    t.integer "category_id"
  end

  add_index "category_deck_links", ["category_id", "deck_id"], name: "index_category_deck_links_on_category_id_and_deck_id", unique: true, using: :btree
  add_index "category_deck_links", ["category_id"], name: "index_category_deck_links_on_category_id", using: :btree
  add_index "category_deck_links", ["deck_id"], name: "index_category_deck_links_on_deck_id", using: :btree

  create_table "current_difficulties", force: :cascade do |t|
    t.integer  "difficulty", null: false
    t.integer  "user_id",    null: false
    t.integer  "deck_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "current_difficulties", ["deck_id"], name: "index_current_difficulties_on_deck_id", using: :btree
  add_index "current_difficulties", ["user_id"], name: "index_current_difficulties_on_user_id", using: :btree

  create_table "decks", force: :cascade do |t|
    t.string  "title"
    t.string  "subtitle"
    t.string  "author"
    t.integer "status"
    t.integer "tier"
  end

  create_table "quotes", force: :cascade do |t|
    t.integer "deck_id"
    t.string  "content"
  end

  add_index "quotes", ["deck_id"], name: "index_quotes_on_deck_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
