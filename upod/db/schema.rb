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

ActiveRecord::Schema.define(version: 20160628041217) do

  create_table "article_blocks", force: :cascade do |t|
    t.integer "position",     limit: 4
    t.integer "article_id",   limit: 4
    t.integer "actable_id",   limit: 4
    t.string  "actable_type", limit: 255
  end

  create_table "article_constant_blocks", force: :cascade do |t|
    t.integer "constant_id", limit: 4
  end

  create_table "article_equation_blocks", force: :cascade do |t|
    t.string "equation", limit: 255
    t.string "description",    limit: 255
  end

  create_table "article_link_blocks", force: :cascade do |t|
    t.string "url",   limit: 255
    t.string "label", limit: 255
  end

  create_table "article_text_blocks", force: :cascade do |t|
    t.text "body", limit: 65535
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "constants", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.decimal  "value",                     precision: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

end
