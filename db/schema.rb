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

ActiveRecord::Schema[7.1].define(version: 2024_06_09_132802) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.integer "happy_hour_id"
    t.string "activity_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["happy_hour_id"], name: "index_activities_on_happy_hour_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "feature_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "happy_hour_features", force: :cascade do |t|
    t.integer "happy_hour_id"
    t.integer "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_happy_hour_features_on_feature_id"
    t.index ["happy_hour_id"], name: "index_happy_hour_features_on_happy_hour_id"
  end

  create_table "happy_hour_timings", force: :cascade do |t|
    t.integer "happy_hour_id"
    t.string "day_of_week"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["happy_hour_id"], name: "index_happy_hour_timings_on_happy_hour_id"
  end

  create_table "happy_hours", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patios", force: :cascade do |t|
    t.integer "happy_hour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["happy_hour_id"], name: "index_patios_on_happy_hour_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "body"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooftops", force: :cascade do |t|
    t.integer "happy_hour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["happy_hour_id"], name: "index_rooftops_on_happy_hour_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "happy_hours"
  add_foreign_key "happy_hour_features", "features"
  add_foreign_key "happy_hour_features", "happy_hours"
  add_foreign_key "happy_hour_timings", "happy_hours"
  add_foreign_key "patios", "happy_hours"
  add_foreign_key "rooftops", "happy_hours"
end
