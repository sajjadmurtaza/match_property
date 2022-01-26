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

ActiveRecord::Schema.define(version: 2022_01_26_153552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.string "offer_type"
    t.string "property_type"
    t.integer "zip_code"
    t.string "city"
    t.string "street"
    t.string "house_number"
    t.float "lng"
    t.float "lat"
    t.integer "construction_year"
    t.float "number_of_rooms"
    t.string "currency"
    t.float "price"
  end

end
