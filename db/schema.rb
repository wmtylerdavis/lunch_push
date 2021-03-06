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

ActiveRecord::Schema.define(version: 20131012203312) do

  create_table "lunches", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lunches", ["user_id"], name: "index_lunches_on_user_id"

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.integer  "vote_count"
    t.boolean  "no_vote",    default: false
    t.integer  "lunch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "restaurants", ["created_at"], name: "index_restaurants_on_created_at"
  add_index "restaurants", ["lunch_id", "vote_count"], name: "index_restaurants_on_lunch_id_and_vote_count"
  add_index "restaurants", ["user_id"], name: "index_restaurants_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "email"
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.boolean  "up_vote",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id", "restaurant_id"], name: "index_votes_on_user_id_and_restaurant_id"

end
