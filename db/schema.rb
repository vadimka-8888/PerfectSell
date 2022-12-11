# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_07_120647) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "btree_gist"
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "dblink"
  enable_extension "dict_int"
  enable_extension "dict_xsyn"
  enable_extension "earthdistance"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "intarray"
  enable_extension "ltree"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "plpgsql"
  enable_extension "tablefunc"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"
  enable_extension "xml2"

  create_table "bargains", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "store_id", null: false
    t.string "status", default: "Considering", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_bargains_on_offer_id"
    t.index ["store_id"], name: "index_bargains_on_store_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "name", null: false
    t.string "measure"
    t.decimal "price", null: false
    t.text "description"
    t.boolean "is_active", default: true, null: false
    t.text "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "proposer_id", null: false
    t.index ["proposer_id"], name: "index_offers_on_proposer_id"
  end

  create_table "proposers", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.text "additional_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.text "description"
    t.string "store_email", null: false
    t.string "store_password", null: false
    t.text "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bargains", "offers"
  add_foreign_key "bargains", "stores"
  add_foreign_key "offers", "proposers"
end
