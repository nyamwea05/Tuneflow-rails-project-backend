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

ActiveRecord::Schema[7.0].define(version: 2023_07_03_090415) do
  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "album_image_url"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.integer "song_id_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id_id"], name: "index_comments_on_song_id_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "song_id_id", null: false
    t.integer "user_id_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id_id"], name: "index_favorites_on_song_id_id"
    t.index ["user_id_id"], name: "index_favorites_on_user_id_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "playlist_name"
    t.string "descriptions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.string "description"
    t.string "image_path"
    t.datetime "release_date"
    t.integer "artist_id_id", null: false
    t.integer "album_id_id", null: false
    t.integer "playlist_id_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id_id"], name: "index_songs_on_album_id_id"
    t.index ["artist_id_id"], name: "index_songs_on_artist_id_id"
    t.index ["playlist_id_id"], name: "index_songs_on_playlist_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "image_url"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "song_ids"
  add_foreign_key "favorites", "song_ids"
  add_foreign_key "favorites", "user_ids"
  add_foreign_key "songs", "album_ids"
  add_foreign_key "songs", "artist_ids"
  add_foreign_key "songs", "playlist_ids"
end
