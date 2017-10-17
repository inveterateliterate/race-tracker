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

ActiveRecord::Schema.define(version: 20170803211548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hashtags", id: :serial, force: :cascade do |t|
    t.string "tag"
    t.integer "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_hashtags_on_race_id"
  end

  create_table "races", id: :serial, force: :cascade do |t|
    t.date "date"
    t.string "name"
    t.string "distance"
    t.datetime "results"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_races_on_user_id"
  end

  create_table "tweets", id: :serial, force: :cascade do |t|
    t.date "date"
    t.string "content"
    t.integer "user_id"
    t.integer "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_tweets_on_race_id"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "access_token"
    t.string "ua_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", id: :serial, force: :cascade do |t|
    t.string "start_time"
    t.string "end_time"
    t.float "distance"
    t.float "speed"
    t.float "pace"
    t.integer "race_id"
    t.integer "tweet_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "hashtags", "races"
  add_foreign_key "races", "users"
  add_foreign_key "tweets", "races"
  add_foreign_key "tweets", "users"
  add_foreign_key "workouts", "users"
end
