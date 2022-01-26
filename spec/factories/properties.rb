# == Schema Information
#
# Table name: properties
#
#  id                :integer          not null, primary key
#  offer_type        :string
#  property_type     :string
#  zip_code          :integer
#  city              :string
#  street            :string
#  house_number      :string
#  lng               :float
#  lat               :float
#  construction_year :integer
#  number_of_rooms   :float
#  currency          :string
#  price             :float
#

# frozen_string_literal: true

FactoryBot.define do
  factory :property do
    offer_type { 'sell' }
    property_type { 'apartment' }
    zip_code { 10_585 }
    city { 'Berlin' }
    street { 'MyString' }
    house_number { 1 }
    lng { 13.3041054 }
    lat { 52.5166023 }
    construction_year { 2001 }
    number_of_rooms { 1.5 }
    currency { 'euro' }
    price { 548_000.0 }
  end
end
