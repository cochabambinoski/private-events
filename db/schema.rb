# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_207_155_205) do
  create_table 'attendances', force: :cascade do |t|
    t.integer 'attendee_id'
    t.integer 'attended_event_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'pending', default: true
    t.boolean 'accepted', default: false
    t.boolean 'rejected', default: false
    t.integer 'host_id'
    t.index ['attended_event_id'], name: 'index_attendances_on_attended_event_id'
    t.index ['attendee_id'], name: 'index_attendances_on_attendee_id'
  end

  create_table 'events', force: :cascade do |t|
    t.text 'content'
    t.integer 'user_id'
    t.datetime 'date'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_events_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'attendances', 'events', column: 'attended_event_id'
  add_foreign_key 'attendances', 'users', column: 'attendee_id'
end
