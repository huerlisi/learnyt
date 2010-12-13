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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101213210836) do

  create_table "addresses", :force => true do |t|
    t.string  "post_office_box",  :limit => 50
    t.string  "extended_address", :limit => 50
    t.string  "street_address",   :limit => 50
    t.string  "locality",         :limit => 50
    t.string  "region",           :limit => 50
    t.string  "postal_code",      :limit => 50
    t.string  "country_name",     :limit => 50
    t.integer "vcard_id"
    t.string  "address_type"
  end

  add_index "addresses", ["vcard_id"], :name => "addresses_vcard_id_index"

  create_table "answers", :force => true do |t|
    t.string   "title"
    t.text     "description", :limit => 255
    t.text     "remarks",     :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "e_mails", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.integer  "recipients_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "send_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "all_day",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "object_id"
    t.string   "object_type"
    t.integer  "user_id"
  end

  create_table "people", :force => true do |t|
    t.string   "type"
    t.date     "date_of_birth"
    t.date     "date_of_death"
    t.integer  "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "remarks"
  end

  create_table "phone_numbers", :force => true do |t|
    t.string  "number",            :limit => 50
    t.string  "phone_number_type", :limit => 50
    t.integer "vcard_id"
    t.integer "object_id"
    t.string  "object_type"
  end

  add_index "phone_numbers", ["object_id", "object_type"], :name => "index_phone_numbers_on_object_id_and_object_type"
  add_index "phone_numbers", ["phone_number_type"], :name => "index_phone_numbers_on_phone_number_type"
  add_index "phone_numbers", ["vcard_id"], :name => "phone_numbers_vcard_id_index"

  create_table "possible_answers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "answer_id"
    t.decimal  "score"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.text     "description", :limit => 255
    t.text     "remarks",     :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_assignments", :force => true do |t|
    t.integer  "user_id"
    t.datetime "due_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quiz_id"
  end

  create_table "quiz_questions", :force => true do |t|
    t.integer  "quiz_id"
    t.integer  "question_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_responses", :force => true do |t|
    t.integer  "quiz_id"
    t.integer  "response_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "quiz_assignment_id"
    t.boolean  "archive",            :default => false
  end

  create_table "quizzes", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipients", :force => true do |t|
    t.integer  "e_mail_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "possible_answer_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.decimal  "score"
    t.integer  "quiz_response_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "locked_at"
    t.integer  "person_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vcards", :force => true do |t|
    t.string  "full_name",        :limit => 50
    t.string  "nickname",         :limit => 50
    t.string  "family_name",      :limit => 50
    t.string  "given_name",       :limit => 50
    t.string  "additional_name",  :limit => 50
    t.string  "honorific_prefix", :limit => 50
    t.string  "honorific_suffix", :limit => 50
    t.boolean "active",                         :default => true
    t.string  "type"
    t.integer "object_id"
    t.string  "object_type"
  end

  add_index "vcards", ["object_id", "object_type"], :name => "index_vcards_on_object_id_and_object_type"

end
