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

ActiveRecord::Schema.define(version: 20171227155812) do

  create_table "line_items", force: :cascade do |t|
    t.integer "variant_id"
    t.integer "order_id"
    t.integer "quantity", null: false
    t.decimal "price", precision: 8, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["variant_id"], name: "index_line_items_on_variant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "number", limit: 15
    t.decimal "item_total", precision: 8, scale: 2, default: "0.0", null: false
    t.decimal "total", precision: 8, scale: 2, default: "0.0", null: false
    t.string "state"
    t.integer "user_id"
    t.datetime "completed_at"
    t.integer "ship_address_id"
    t.decimal "payment_total", precision: 8, scale: 2, default: "0.0"
    t.string "payment_state"
    t.text "special_instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ship_address_id"], name: "index_orders_on_ship_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_properties", force: :cascade do |t|
    t.string "value"
    t.integer "product_id"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_properties_on_product_id"
    t.index ["property_id"], name: "index_product_properties_on_property_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "presentation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties_prototypes", force: :cascade do |t|
    t.integer "prototype_id"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_properties_prototypes_on_property_id"
    t.index ["prototype_id"], name: "index_properties_prototypes_on_prototype_id"
  end

  create_table "prototypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxonomies", force: :cascade do |t|
    t.string "name"
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxons", force: :cascade do |t|
    t.string "name"
    t.integer "taxonomy_id"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.string "icon_file_name"
    t.string "description"
    t.integer "position"
    t.integer "depth", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lft"], name: "index_taxons_on_lft"
    t.index ["parent_id"], name: "index_taxons_on_parent_id"
    t.index ["rgt"], name: "index_taxons_on_rgt"
    t.index ["taxonomy_id"], name: "index_taxons_on_taxonomy_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variants", force: :cascade do |t|
    t.string "sku", default: "", null: false
    t.decimal "price", precision: 8, scale: 2
    t.decimal "weight", precision: 8, scale: 2
    t.decimal "height", precision: 8, scale: 2
    t.decimal "width", precision: 8, scale: 2
    t.decimal "depth", precision: 8, scale: 2
    t.boolean "is_master", default: false
    t.integer "product_id"
    t.integer "position"
    t.datetime "discontinue_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

end
