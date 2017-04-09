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

ActiveRecord::Schema.define(version: 20170407083830) do

  create_table "announces", force: :cascade do |t|
    t.string   "announce_title"
    t.string   "announce_content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "linetalks", force: :cascade do |t|
    t.string   "linetalk_content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_picture_url"
    t.string   "product_website"
    t.string   "product_website_detail_address"
    t.string   "product_title"
    t.integer  "product_price"
    t.string   "product_number"
    t.string   "product_category"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "product_sub_category"
  end

  create_table "reviewreplies", force: :cascade do |t|
    t.string   "reviewreplyname"
    t.string   "reviewreplycontent"
    t.integer  "review_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "review_title"
    t.string   "review_writer"
    t.string   "review_content"
    t.string   "review_passwd"
    t.string   "review_website"
    t.string   "review_prod_name"
    t.string   "review_image_url"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "review_viewcount", default: 0
  end

  create_table "sojoong2talks", force: :cascade do |t|
    t.string   "talk_thumbnail"
    t.string   "talk_content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sudareplies", force: :cascade do |t|
    t.string   "sudareplyname"
    t.string   "sudareplycontent"
    t.integer  "suda_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "sudas", force: :cascade do |t|
    t.string   "suda_title"
    t.string   "suda_writer"
    t.string   "suda_content"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "suda_passwd"
    t.integer  "suda_viewcount", default: 0
  end

end
