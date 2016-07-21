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

ActiveRecord::Schema.define(version: 20160721163639) do

  create_table "article_blocks", force: :cascade do |t|
    t.integer "position",     limit: 4
    t.integer "article_id",   limit: 4
    t.integer "actable_id",   limit: 4,   null: false
    t.string  "actable_type", limit: 255
  end

  add_index "article_blocks", ["actable_id"], name: "index_article_blocks_on_actable_id", using: :btree

  create_table "article_constant_blocks", force: :cascade do |t|
    t.integer "constant_id", limit: 4
  end

  create_table "article_diagram_blocks", force: :cascade do |t|
    t.integer  "diagram_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "code",       limit: 65535
    t.string   "caption",    limit: 255
  end

  create_table "article_equation_blocks", force: :cascade do |t|
    t.text   "equation", limit: 65535
    t.string "label",    limit: 255
  end

  create_table "article_image_blocks", force: :cascade do |t|
    t.integer  "image_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "article_link_blocks", force: :cascade do |t|
    t.string "source",   limit: 255
    t.string "video_id", limit: 255, null: false
  end

  create_table "article_text_blocks", force: :cascade do |t|
    t.text "body", limit: 65535
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
    t.string   "image",       limit: 255
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "article_id",     limit: 4
    t.integer  "subcategory_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "description",    limit: 255
  end

  create_table "constants", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.decimal  "value",                     precision: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "contributors", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "article_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "diagrams", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.string   "label",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "equation_block_variables", force: :cascade do |t|
    t.string   "variable",                  limit: 255
    t.string   "description",               limit: 255
    t.integer  "article_equation_block_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "equation_block_variables", ["article_equation_block_id"], name: "index_equation_block_variables_on_article_equation_block_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.text     "body",              limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "body_secure_token", limit: 255
  end

  create_table "searches", force: :cascade do |t|
    t.string   "query",        limit: 255
    t.datetime "searched_at"
    t.datetime "converted_at"
    t.integer  "article_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "category_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "equation_block_variables", "article_equation_blocks"
  add_foreign_key "subcategories", "categories"
end
