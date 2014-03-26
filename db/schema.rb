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

ActiveRecord::Schema.define(version: 20131208221638) do

  create_table "episodes", force: true do |t|
    t.string   "name"
    t.date     "release_date"
    t.text     "description"
    t.integer  "number"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "episodes", ["season_id"], name: "index_episodes_on_season_id"

  create_table "link_episodes", force: true do |t|
    t.string   "link_text"
    t.integer  "user_id"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "link_episodes", ["episode_id"], name: "index_link_episodes_on_episode_id"
  add_index "link_episodes", ["user_id"], name: "index_link_episodes_on_user_id"

  create_table "link_movies", force: true do |t|
    t.string   "link_text"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "link_movies", ["movie_id"], name: "index_link_movies_on_movie_id"
  add_index "link_movies", ["user_id"], name: "index_link_movies_on_user_id"

  create_table "link_seasons", force: true do |t|
    t.string   "link_text"
    t.integer  "user_id"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "link_seasons", ["season_id"], name: "index_link_seasons_on_season_id"
  add_index "link_seasons", ["user_id"], name: "index_link_seasons_on_user_id"

  create_table "link_series", force: true do |t|
    t.string   "link_text"
    t.integer  "series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "link_series", ["series_id"], name: "index_link_series_on_series_id"
  add_index "link_series", ["user_id"], name: "index_link_series_on_user_id"

  create_table "link_shows", force: true do |t|
    t.string   "link_text"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "link_shows", ["show_id"], name: "index_link_shows_on_show_id"
  add_index "link_shows", ["user_id"], name: "index_link_shows_on_user_id"

  create_table "movies", force: true do |t|
    t.string   "name"
    t.date     "release_date"
    t.text     "description"
    t.integer  "number"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  add_index "movies", ["show_id"], name: "index_movies_on_show_id"

  create_table "photo_episodes", force: true do |t|
    t.text     "description"
    t.string   "file"
    t.string   "path"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
  end

  add_index "photo_episodes", ["episode_id"], name: "index_photo_episodes_on_episode_id"
  add_index "photo_episodes", ["user_id"], name: "index_photo_episodes_on_user_id"

  create_table "photo_movies", force: true do |t|
    t.text     "description"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.integer  "user_id"
  end

  add_index "photo_movies", ["movie_id"], name: "index_photo_movies_on_movie_id"
  add_index "photo_movies", ["user_id"], name: "index_photo_movies_on_user_id"

  create_table "photo_seasons", force: true do |t|
    t.text     "description"
    t.string   "file"
    t.string   "path"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
  end

  add_index "photo_seasons", ["season_id"], name: "index_photo_seasons_on_season_id"
  add_index "photo_seasons", ["user_id"], name: "index_photo_seasons_on_user_id"

  create_table "photo_series", force: true do |t|
    t.text     "description"
    t.integer  "series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.integer  "user_id"
  end

  add_index "photo_series", ["series_id"], name: "index_photo_series_on_series_id"
  add_index "photo_series", ["user_id"], name: "index_photo_series_on_user_id"

  create_table "photo_shows", force: true do |t|
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.integer  "user_id"
  end

  add_index "photo_shows", ["show_id"], name: "index_photo_shows_on_show_id"
  add_index "photo_shows", ["user_id"], name: "index_photo_shows_on_user_id"

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "show_id"
    t.integer  "movie_id"
    t.integer  "series_id"
    t.integer  "season_id"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["episode_id"], name: "index_reviews_on_episode_id"
  add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id"
  add_index "reviews", ["season_id"], name: "index_reviews_on_season_id"
  add_index "reviews", ["series_id"], name: "index_reviews_on_series_id"
  add_index "reviews", ["show_id"], name: "index_reviews_on_show_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "seasons", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "series_id"
  end

  add_index "seasons", ["series_id"], name: "index_seasons_on_series_id"

  create_table "seen_episodes", force: true do |t|
    t.integer  "user_id"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seen_episodes", ["episode_id"], name: "index_seen_episodes_on_episode_id"
  add_index "seen_episodes", ["user_id"], name: "index_seen_episodes_on_user_id"

  create_table "seen_movies", force: true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seen_movies", ["movie_id"], name: "index_seen_movies_on_movie_id"
  add_index "seen_movies", ["user_id"], name: "index_seen_movies_on_user_id"

  create_table "seen_seasons", force: true do |t|
    t.integer  "user_id"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seen_seasons", ["season_id"], name: "index_seen_seasons_on_season_id"
  add_index "seen_seasons", ["user_id"], name: "index_seen_seasons_on_user_id"

  create_table "seen_series", force: true do |t|
    t.integer  "user_id"
    t.integer  "series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seen_series", ["series_id"], name: "index_seen_series_on_series_id"
  add_index "seen_series", ["user_id"], name: "index_seen_series_on_user_id"

  create_table "seens", force: true do |t|
    t.integer  "user_id"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seens", ["show_id"], name: "index_seens_on_show_id"
  add_index "seens", ["user_id"], name: "index_seens_on_user_id"

  create_table "series", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.integer  "number"
    t.integer  "show_id"
    t.integer  "seasons_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  add_index "series", ["seasons_id"], name: "index_series_on_seasons_id"
  add_index "series", ["show_id"], name: "index_series_on_show_id"

  create_table "shows", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  create_table "trailers", force: true do |t|
    t.string   "url"
    t.integer  "show_id"
    t.integer  "movie_id"
    t.integer  "series_id"
    t.integer  "season_id"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "trailers", ["user_id"], name: "index_trailers_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "type_of_user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "watchlist_episodes", force: true do |t|
    t.integer  "user_id"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "watchlist_episodes", ["episode_id"], name: "index_watchlist_episodes_on_episode_id"
  add_index "watchlist_episodes", ["user_id"], name: "index_watchlist_episodes_on_user_id"

  create_table "watchlist_movies", force: true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "watchlist_movies", ["movie_id"], name: "index_watchlist_movies_on_movie_id"
  add_index "watchlist_movies", ["user_id"], name: "index_watchlist_movies_on_user_id"

  create_table "watchlist_seasons", force: true do |t|
    t.integer  "user_id"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "watchlist_seasons", ["season_id"], name: "index_watchlist_seasons_on_season_id"
  add_index "watchlist_seasons", ["user_id"], name: "index_watchlist_seasons_on_user_id"

  create_table "watchlist_series", force: true do |t|
    t.integer  "user_id"
    t.integer  "series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "watchlist_series", ["series_id"], name: "index_watchlist_series_on_series_id"
  add_index "watchlist_series", ["user_id"], name: "index_watchlist_series_on_user_id"

  create_table "watchlist_shows", force: true do |t|
    t.integer  "user_id"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "watchlist_shows", ["show_id"], name: "index_watchlist_shows_on_show_id"
  add_index "watchlist_shows", ["user_id"], name: "index_watchlist_shows_on_user_id"

end
