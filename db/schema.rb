ActiveRecord::Schema.define(version: 20170803211548) do
  enable_extension "plpgsql"

  create_table "hash_tags", force: :cascade do |t|
    t.string   "tag"
    t.integer  "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_hash_tags_on_race_id", using: :btree
  end

  create_table "races", force: :cascade do |t|
    t.date     "date"
    t.string   "name"
    t.string   "distance"
    t.datetime "results"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_races_on_user_id", using: :btree
  end

  create_table "tweets", force: :cascade do |t|
    t.date     "date"
    t.string   "content"
    t.integer  "user_id"
    t.integer  "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_tweets_on_race_id", using: :btree
    t.index ["user_id"], name: "index_tweets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "access_token"
    t.string   "ua_user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string   "start_time"
    t.string   "end_time"
    t.float    "distance"
    t.float    "speed"
    t.float    "pace"
    t.integer  "race_id"
    t.integer  "tweet_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workouts_on_user_id", using: :btree
  end

  add_foreign_key "hash_tags", "races"
  add_foreign_key "races", "users"
  add_foreign_key "tweets", "races"
  add_foreign_key "tweets", "users"
  add_foreign_key "workouts", "users"
end
