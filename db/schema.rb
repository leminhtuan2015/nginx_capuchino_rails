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

ActiveRecord::Schema.define(version: 20150414075109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles_tags", id: false, force: true do |t|
    t.integer "article_id"
    t.integer "tag_id"
  end

  create_table "blogs", force: true do |t|
    t.text   "settings"
    t.string "base_url"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree

  create_table "contents", force: true do |t|
    t.string   "type"
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.text     "extended"
    t.text     "excerpt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "permalink"
    t.string   "guid"
    t.integer  "text_filter_id"
    t.text     "whiteboard"
    t.string   "name"
    t.boolean  "published",      default: false
    t.boolean  "allow_pings"
    t.boolean  "allow_comments"
    t.datetime "published_at"
    t.string   "state"
    t.integer  "parent_id"
    t.text     "settings"
    t.string   "post_type",      default: "read"
  end

  add_index "contents", ["published"], name: "index_contents_on_published", using: :btree
  add_index "contents", ["text_filter_id"], name: "index_contents_on_text_filter_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "company"
    t.string   "family_name"
    t.string   "first_name"
    t.string   "tel"
    t.string   "password"
    t.string   "postal_code"
    t.integer  "prefectural_id"
    t.string   "city"
    t.string   "street"
    t.string   "building"
    t.string   "siteurl"
    t.date     "birthday"
    t.integer  "sex"
    t.boolean  "mailmagazine_accepted"
    t.string   "facebook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["prefectural_id"], name: "index_customers_on_prefectural_id", using: :btree

  create_table "feedback", force: true do |t|
    t.string   "type"
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.text     "excerpt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "guid"
    t.integer  "text_filter_id"
    t.text     "whiteboard"
    t.integer  "article_id"
    t.string   "email"
    t.string   "url"
    t.string   "ip",               limit: 40
    t.string   "blog_name"
    t.boolean  "published",                   default: false
    t.datetime "published_at"
    t.string   "state"
    t.boolean  "status_confirmed"
    t.string   "user_agent"
  end

  add_index "feedback", ["article_id"], name: "index_feedback_on_article_id", using: :btree
  add_index "feedback", ["text_filter_id"], name: "index_feedback_on_text_filter_id", using: :btree

  create_table "mail_templates", force: true do |t|
    t.string   "name"
    t.string   "subject"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mail_templates", ["name"], name: "index_mail_templates_on_name", unique: true, using: :btree

  create_table "page_caches", force: true do |t|
    t.string "name"
  end

  add_index "page_caches", ["name"], name: "index_page_caches_on_name", using: :btree

  create_table "pings", force: true do |t|
    t.integer  "article_id"
    t.string   "url"
    t.datetime "created_at"
  end

  add_index "pings", ["article_id"], name: "index_pings_on_article_id", using: :btree

  create_table "post_types", force: true do |t|
    t.string "name"
    t.string "permalink"
    t.string "description"
  end

  create_table "prefecturals", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "prefecturals", ["name"], name: "index_prefecturals_on_name", using: :btree

  create_table "profiles", force: true do |t|
    t.string "label"
    t.string "nicename"
    t.text   "modules"
  end

  create_table "profiles_rights", id: false, force: true do |t|
    t.integer "profile_id"
    t.integer "right_id"
  end

  create_table "redirections", force: true do |t|
    t.integer "content_id"
    t.integer "redirect_id"
  end

  create_table "redirects", force: true do |t|
    t.string   "from_path"
    t.string   "to_path"
    t.string   "origin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.integer  "size"
    t.string   "upload"
    t.string   "mime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_id"
    t.boolean  "itunes_metadata"
    t.string   "itunes_author"
    t.string   "itunes_subtitle"
    t.integer  "itunes_duration"
    t.text     "itunes_summary"
    t.string   "itunes_keywords"
    t.string   "itunes_category"
    t.boolean  "itunes_explicit"
  end

  create_table "seminers", force: true do |t|
    t.string   "title"
    t.string   "place"
    t.datetime "date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sidebars", force: true do |t|
    t.integer "active_position"
    t.text    "config"
    t.integer "staged_position"
    t.string  "type"
  end

  create_table "sitealizer", force: true do |t|
    t.string   "path"
    t.string   "ip"
    t.string   "referer"
    t.string   "language"
    t.string   "user_agent"
    t.datetime "created_at"
    t.date     "created_on"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name"
  end

  create_table "text_filters", force: true do |t|
    t.string "name"
    t.string "description"
    t.string "markup"
    t.text   "filters"
    t.text   "params"
  end

  create_table "triggers", force: true do |t|
    t.integer  "pending_item_id"
    t.string   "pending_item_type"
    t.datetime "due_at"
    t.string   "trigger_method"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.text     "email"
    t.text     "name"
    t.boolean  "notify_via_email"
    t.boolean  "notify_on_new_articles"
    t.boolean  "notify_on_comments"
    t.integer  "profile_id"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "text_filter_id",            default: "1"
    t.string   "state",                     default: "active"
    t.datetime "last_connection"
    t.text     "settings"
    t.integer  "resource_id"
  end

end
