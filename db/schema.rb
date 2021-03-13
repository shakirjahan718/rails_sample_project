# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_13_072534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "add_line1"
    t.string "add_line2"
    t.string "zipcode"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "distributions", force: :cascade do |t|
    t.integer "manufacturer_id"
    t.integer "product_id"
    t.integer "reseller_id"
    t.integer "units_sold"
    t.decimal "unit_price"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
  end

  create_table "manufacturers_resellers", id: false, force: :cascade do |t|
    t.bigint "manufacturer_id", null: false
    t.bigint "reseller_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "manufacturer_id"
  end

  create_table "resellers", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.integer "age"
    t.integer "points"
    t.string "gender"
    t.string "name"
    t.integer "city_id"
    t.string "email"
  end

end
