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

ActiveRecord::Schema.define(version: 2020_08_24_023724) do

  create_table "attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "knowledge_id"
    t.string "sub_id"
    t.string "name"
    t.string "width_size"
    t.string "height_size"
    t.string "file_type"
    t.string "file_size"
    t.text "image"
    t.text "thumb_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_url"
    t.index ["knowledge_id"], name: "index_attachments_on_knowledge_id"
  end

  create_table "color_manages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "color_type"
    t.string "color_flg"
    t.string "color_1"
    t.string "color_2"
    t.string "group_word"
    t.string "word_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group_flg"
    t.string "parent_id"
  end

  create_table "display_controls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "control_type"
    t.string "control_value"
    t.string "yobi_1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "in_genre", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_genres_on_user_id"
  end

  create_table "knowledges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "genre_id"
    t.string "title"
    t.text "content"
    t.string "color_group_no"
    t.string "yobi_1"
    t.string "yobi_2"
    t.string "yobi_3"
    t.string "yobi_4"
    t.string "yobi_5"
    t.string "src_flg"
    t.string "img_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
    t.string "public_flg"
    t.bigint "color_manage_id"
    t.text "remark"
    t.string "remark_flg"
    t.index ["color_manage_id"], name: "index_knowledges_on_color_manage_id"
    t.index ["genre_id"], name: "index_knowledges_on_genre_id"
    t.index ["user_id"], name: "index_knowledges_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.binary "user_image", limit: 16777215
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attachments", "knowledges"
  add_foreign_key "genres", "users"
  add_foreign_key "knowledges", "genres"
  add_foreign_key "knowledges", "users"
end
