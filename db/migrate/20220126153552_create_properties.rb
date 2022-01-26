# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :offer_type
      t.string :property_type
      t.integer :zip_code
      t.string :city
      t.string :street
      t.string :house_number
      t.float :lng
      t.float :lat
      t.integer :construction_year
      t.float :number_of_rooms
      t.string :currency
      t.float :price
    end
  end
end
