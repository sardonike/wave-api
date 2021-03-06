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

ActiveRecord::Schema.define(version: 20160806141806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: :cascade do |t|
    t.string   "access_token",   null: false
    t.string   "remember_token", null: false
    t.integer  "user_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string  "street_number"
    t.text    "route",               null: false
    t.string  "locality",            null: false
    t.string  "administrative_area", null: false
    t.string  "country",             null: false
    t.string  "postal_code",         null: false
    t.text    "coordinates"
    t.integer "user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "route_id", null: false
    t.integer  "user_id",  null: false
    t.datetime "schedule", null: false
  end

  add_index "bookings", ["route_id"], name: "index_bookings_on_route_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "point_users", force: :cascade do |t|
    t.integer "point_id",   null: false
    t.integer "user_id",    null: false
    t.integer "point_type", null: false
  end

  add_index "point_users", ["point_id"], name: "index_point_users_on_point_id", using: :btree
  add_index "point_users", ["user_id"], name: "index_point_users_on_user_id", using: :btree

  create_table "points", force: :cascade do |t|
    t.string "name",        null: false
    t.text   "coordinates"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "origin_id",                                                              null: false
    t.integer "destination_id",                                                         null: false
    t.decimal "price",          precision: 8, scale: 2, default: 0.0
    t.time    "time",                                   default: '2000-01-01 00:00:00', null: false
  end

  add_index "routes", ["destination_id"], name: "index_routes_on_destination_id", using: :btree
  add_index "routes", ["origin_id"], name: "index_routes_on_origin_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "phone",                  default: "", null: false
    t.string   "company",                default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
