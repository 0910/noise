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

ActiveRecord::Schema.define(version: 20170316161109) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "artist_translations", force: :cascade do |t|
    t.integer  "artist_id",  limit: 4,     null: false
    t.string   "locale",     limit: 255,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "bio",        limit: 65535
  end

  add_index "artist_translations", ["artist_id"], name: "index_artist_translations_on_artist_id", using: :btree
  add_index "artist_translations", ["locale"], name: "index_artist_translations_on_locale", using: :btree

  create_table "artists", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "country",            limit: 255
    t.text     "bio",                limit: 65535
    t.string   "facebook_link",      limit: 255
    t.string   "soundcloud_link",    limit: 255
    t.string   "twitter_link",       limit: 255
    t.string   "instagram_link",     limit: 255
    t.string   "youtube_link",       limit: 255
    t.string   "beatport_link",      limit: 255
    t.integer  "festival_id",        limit: 4
    t.string   "slug",               limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "position",           limit: 4
    t.string   "ra_link",            limit: 255
  end

  add_index "artists", ["festival_id"], name: "index_artists_on_festival_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "days", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.date     "date"
    t.integer  "festival_id", limit: 4
    t.string   "slug",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "days", ["festival_id"], name: "index_days_on_festival_id", using: :btree

  create_table "event_artists", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.integer  "artist_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "position",   limit: 4
  end

  add_index "event_artists", ["artist_id"], name: "index_event_artists_on_artist_id", using: :btree
  add_index "event_artists", ["event_id"], name: "index_event_artists_on_event_id", using: :btree

  create_table "event_translations", force: :cascade do |t|
    t.integer  "event_id",    limit: 4,     null: false
    t.string   "locale",      limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "description", limit: 65535
  end

  add_index "event_translations", ["event_id"], name: "index_event_translations_on_event_id", using: :btree
  add_index "event_translations", ["locale"], name: "index_event_translations_on_locale", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.datetime "starts_on"
    t.datetime "finish_on"
    t.text     "description",        limit: 65535
    t.string   "slug",               limit: 255
    t.integer  "festival_id",        limit: 4
    t.integer  "venue_id",           limit: 4
    t.string   "tickets",            limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "tickets_link",       limit: 255
    t.text     "tickets_widget",     limit: 65535
    t.integer  "day_id",             limit: 4
    t.integer  "stage_id",           limit: 4
  end

  add_index "events", ["day_id"], name: "index_events_on_day_id", using: :btree
  add_index "events", ["festival_id"], name: "index_events_on_festival_id", using: :btree
  add_index "events", ["stage_id"], name: "index_events_on_stage_id", using: :btree
  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "festival_themes", force: :cascade do |t|
    t.integer  "festival_id", limit: 4
    t.integer  "theme_id",    limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "festival_themes", ["festival_id"], name: "index_festival_themes_on_festival_id", using: :btree
  add_index "festival_themes", ["theme_id"], name: "index_festival_themes_on_theme_id", using: :btree

  create_table "festival_translations", force: :cascade do |t|
    t.integer  "festival_id",         limit: 4,   null: false
    t.string   "locale",              limit: 255, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "menu_title_home",     limit: 255
    t.string   "menu_title_artists",  limit: 255
    t.string   "menu_title_events",   limit: 255
    t.string   "menu_title_news",     limit: 255
    t.string   "menu_title_videos",   limit: 255
    t.string   "menu_title_venues",   limit: 255
    t.string   "menu_title_contacts", limit: 255
    t.string   "menu_title_sponsors", limit: 255
  end

  add_index "festival_translations", ["festival_id"], name: "index_festival_translations_on_festival_id", using: :btree
  add_index "festival_translations", ["locale"], name: "index_festival_translations_on_locale", using: :btree

  create_table "festivals", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.text     "description",             limit: 65535
    t.string   "slug",                    limit: 255
    t.string   "email",                   limit: 255,   default: "", null: false
    t.string   "encrypted_password",      limit: 255,   default: "", null: false
    t.string   "reset_password_token",    limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",      limit: 255
    t.string   "last_sign_in_ip",         limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "facebook",                limit: 255
    t.string   "twitter",                 limit: 255
    t.string   "instagram",               limit: 255
    t.string   "resident",                limit: 255
    t.string   "soundcloud",              limit: 255
    t.text     "template",                limit: 65535
    t.string   "logo_file_name",          limit: 255
    t.string   "logo_content_type",       limit: 255
    t.integer  "logo_file_size",          limit: 4
    t.datetime "logo_updated_at"
    t.text     "css",                     limit: 65535
    t.string   "url",                     limit: 255
    t.string   "keywords",                limit: 255
    t.string   "image_file_name",         limit: 255
    t.string   "image_content_type",      limit: 255
    t.integer  "image_file_size",         limit: 4
    t.datetime "image_updated_at"
    t.string   "css_file_file_name",      limit: 255
    t.string   "css_file_content_type",   limit: 255
    t.integer  "css_file_file_size",      limit: 4
    t.datetime "css_file_updated_at"
    t.string   "regular_contact_address", limit: 255
    t.string   "press_contact_address",   limit: 255
    t.string   "ra_link",                 limit: 255
    t.string   "menu_title_home",         limit: 255
    t.string   "menu_title_artists",      limit: 255
    t.string   "menu_title_events",       limit: 255
    t.string   "menu_title_news",         limit: 255
    t.string   "menu_title_videos",       limit: 255
    t.string   "menu_title_venues",       limit: 255
    t.string   "menu_title_contacts",     limit: 255
    t.string   "youtube",                 limit: 255
    t.boolean  "published",               limit: 1
    t.string   "menu_title_sponsors",     limit: 255
  end

  add_index "festivals", ["email"], name: "index_festivals_on_email", unique: true, using: :btree
  add_index "festivals", ["reset_password_token"], name: "index_festivals_on_reset_password_token", unique: true, using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.integer  "show_id",           limit: 4
    t.boolean  "cover",             limit: 1,   default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "festival_id",       limit: 4
    t.integer  "news_id",           limit: 4
    t.integer  "position",          limit: 4
  end

  add_index "images", ["festival_id"], name: "index_images_on_festival_id", using: :btree
  add_index "images", ["news_id"], name: "index_images_on_news_id", using: :btree
  add_index "images", ["show_id"], name: "index_images_on_show_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "subtitle",           limit: 255
    t.date     "date"
    t.text     "body",               limit: 65535
    t.integer  "festival_id",        limit: 4
    t.string   "slug",               limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "featured",           limit: 255,   default: "No"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "link",               limit: 255
    t.string   "news_type",          limit: 255
    t.string   "video",              limit: 255
  end

  add_index "news", ["festival_id"], name: "index_news_on_festival_id", using: :btree

  create_table "news_translations", force: :cascade do |t|
    t.integer  "news_id",    limit: 4,     null: false
    t.string   "locale",     limit: 255,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "title",      limit: 255
    t.string   "subtitle",   limit: 255
    t.text     "body",       limit: 65535
  end

  add_index "news_translations", ["locale"], name: "index_news_translations_on_locale", using: :btree
  add_index "news_translations", ["news_id"], name: "index_news_translations_on_news_id", using: :btree

  create_table "newsletters", force: :cascade do |t|
    t.string   "email",       limit: 255
    t.string   "section",     limit: 255
    t.integer  "festival_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "newsletters", ["festival_id"], name: "index_newsletters_on_festival_id", using: :btree

  create_table "presentations", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "event_id",    limit: 4
    t.integer  "festival_id", limit: 4
    t.integer  "artist_id",   limit: 4
    t.datetime "starts_on"
    t.datetime "finishes_on"
    t.string   "slug",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.time     "time"
    t.integer  "duration",    limit: 4
    t.integer  "stage_id",    limit: 4
  end

  add_index "presentations", ["artist_id"], name: "index_presentations_on_artist_id", using: :btree
  add_index "presentations", ["event_id"], name: "index_presentations_on_event_id", using: :btree
  add_index "presentations", ["festival_id"], name: "index_presentations_on_festival_id", using: :btree
  add_index "presentations", ["stage_id"], name: "index_presentations_on_stage_id", using: :btree

  create_table "press_contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "starts_on"
    t.datetime "finish_on"
    t.text     "description", limit: 65535
    t.integer  "festival_id", limit: 4
    t.integer  "event_id",    limit: 4
    t.string   "slug",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "shows", ["event_id"], name: "index_shows_on_event_id", using: :btree
  add_index "shows", ["festival_id"], name: "index_shows_on_festival_id", using: :btree

  create_table "splash_translations", force: :cascade do |t|
    t.integer  "splash_id",      limit: 4,     null: false
    t.string   "locale",         limit: 255,   null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "title",          limit: 65535
    t.text     "subtitle",       limit: 65535
    t.text     "call_to_action", limit: 65535
  end

  add_index "splash_translations", ["locale"], name: "index_splash_translations_on_locale", using: :btree
  add_index "splash_translations", ["splash_id"], name: "index_splash_translations_on_splash_id", using: :btree

  create_table "splashes", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.string   "subtitle",            limit: 255
    t.string   "call_to_action",      limit: 255
    t.string   "call_to_action_link", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "photo_file_name",     limit: 255
    t.string   "photo_content_type",  limit: 255
    t.integer  "photo_file_size",     limit: 4
    t.datetime "photo_updated_at"
    t.integer  "festival_id",         limit: 4
  end

  add_index "splashes", ["festival_id"], name: "index_splashes_on_festival_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "link",               limit: 255
    t.integer  "festival_id",        limit: 4
    t.string   "slug",               limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "sponsors", ["festival_id"], name: "index_sponsors_on_festival_id", using: :btree

  create_table "stages", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "day_id",      limit: 4
    t.integer  "festival_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug",        limit: 255
  end

  add_index "stages", ["day_id"], name: "index_stages_on_day_id", using: :btree
  add_index "stages", ["festival_id"], name: "index_stages_on_festival_id", using: :btree

  create_table "templates", force: :cascade do |t|
    t.text     "name",        limit: 65535
    t.text     "body",        limit: 65535
    t.boolean  "partial",     limit: 1,     default: false
    t.string   "path",        limit: 255
    t.string   "format",      limit: 255,   default: "html"
    t.string   "locale",      limit: 255
    t.string   "handler",     limit: 255,   default: "curly"
    t.integer  "festival_id", limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "templates", ["festival_id"], name: "index_templates_on_festival_id", using: :btree

  create_table "themes", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.integer  "festival_id",                limit: 4
    t.text     "custom_html",                limit: 65535
    t.text     "custom_html_preview",        limit: 65535
    t.text     "custom_css",                 limit: 65535
    t.text     "custom_css_preview",         limit: 65535
    t.text     "custom_js",                  limit: 65535
    t.text     "custom_js_preview",          limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "intro_photo_file_name",      limit: 255
    t.string   "intro_photo_content_type",   limit: 255
    t.integer  "intro_photo_file_size",      limit: 4
    t.datetime "intro_photo_updated_at"
    t.string   "home_photo_file_name",       limit: 255
    t.string   "home_photo_content_type",    limit: 255
    t.integer  "home_photo_file_size",       limit: 4
    t.datetime "home_photo_updated_at"
    t.string   "artists_photo_file_name",    limit: 255
    t.string   "artists_photo_content_type", limit: 255
    t.integer  "artists_photo_file_size",    limit: 4
    t.datetime "artists_photo_updated_at"
    t.string   "events_photo_file_name",     limit: 255
    t.string   "events_photo_content_type",  limit: 255
    t.integer  "events_photo_file_size",     limit: 4
    t.datetime "events_photo_updated_at"
    t.string   "news_photo_file_name",       limit: 255
    t.string   "news_photo_content_type",    limit: 255
    t.integer  "news_photo_file_size",       limit: 4
    t.datetime "news_photo_updated_at"
    t.string   "shows_photo_file_name",      limit: 255
    t.string   "shows_photo_content_type",   limit: 255
    t.integer  "shows_photo_file_size",      limit: 4
    t.datetime "shows_photo_updated_at"
    t.string   "venues_photo_file_name",     limit: 255
    t.string   "venues_photo_content_type",  limit: 255
    t.integer  "venues_photo_file_size",     limit: 4
    t.datetime "venues_photo_updated_at"
    t.string   "videos_photo_file_name",     limit: 255
    t.string   "videos_photo_content_type",  limit: 255
    t.integer  "videos_photo_file_size",     limit: 4
    t.datetime "videos_photo_updated_at"
    t.string   "slug",                       limit: 255
  end

  add_index "themes", ["festival_id"], name: "index_themes_on_festival_id", using: :btree

  create_table "venue_translations", force: :cascade do |t|
    t.integer  "venue_id",    limit: 4,     null: false
    t.string   "locale",      limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "description", limit: 65535
  end

  add_index "venue_translations", ["locale"], name: "index_venue_translations_on_locale", using: :btree
  add_index "venue_translations", ["venue_id"], name: "index_venue_translations_on_venue_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "location",           limit: 255
    t.integer  "capacity",           limit: 4
    t.text     "description",        limit: 65535
    t.string   "slug",               limit: 255
    t.integer  "festival_id",        limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "venues", ["festival_id"], name: "index_venues_on_festival_id", using: :btree

  create_table "video_translations", force: :cascade do |t|
    t.integer  "video_id",    limit: 4,     null: false
    t.string   "locale",      limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
  end

  add_index "video_translations", ["locale"], name: "index_video_translations_on_locale", using: :btree
  add_index "video_translations", ["video_id"], name: "index_video_translations_on_video_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.text     "link",               limit: 65535
    t.integer  "festival_id",        limit: 4
    t.string   "slug",               limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "featured",           limit: 255,   default: "No"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "videos", ["festival_id"], name: "index_videos_on_festival_id", using: :btree

  create_table "widgets", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "code",        limit: 65535
    t.integer  "festival_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "widgets", ["festival_id"], name: "index_widgets_on_festival_id", using: :btree

  add_foreign_key "artists", "festivals"
  add_foreign_key "days", "festivals"
  add_foreign_key "event_artists", "artists"
  add_foreign_key "event_artists", "events"
  add_foreign_key "events", "days"
  add_foreign_key "events", "festivals"
  add_foreign_key "events", "stages"
  add_foreign_key "events", "venues"
  add_foreign_key "festival_themes", "festivals"
  add_foreign_key "festival_themes", "themes"
  add_foreign_key "images", "festivals"
  add_foreign_key "images", "news"
  add_foreign_key "images", "shows"
  add_foreign_key "news", "festivals"
  add_foreign_key "newsletters", "festivals"
  add_foreign_key "presentations", "artists"
  add_foreign_key "presentations", "events"
  add_foreign_key "presentations", "festivals"
  add_foreign_key "presentations", "stages"
  add_foreign_key "shows", "events"
  add_foreign_key "shows", "festivals"
  add_foreign_key "splashes", "festivals"
  add_foreign_key "sponsors", "festivals"
  add_foreign_key "stages", "days"
  add_foreign_key "stages", "festivals"
  add_foreign_key "templates", "festivals"
  add_foreign_key "themes", "festivals"
  add_foreign_key "venues", "festivals"
  add_foreign_key "videos", "festivals"
  add_foreign_key "widgets", "festivals"
end
