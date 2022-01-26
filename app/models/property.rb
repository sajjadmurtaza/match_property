# frozen_string_literal: true

class Property < ApplicationRecord
  validates :offer_type, :property_type, :lng, :lat, presence: true

  geocoded_by :address
  reverse_geocoded_by :lat, :lng
  after_validation :geocode

  scope :nearby, ->(latitude, longitude, radius) { near([latitude, longitude], radius) }

  def address
    [street, city, zip_code].compact.join(', ')
  end

  def self.search(latitude:, longitude:, property_type:, marketing_type:)
    nearby(latitude, longitude, 15).where('offer_type = ? AND property_type = ?', marketing_type, property_type)
  end
end
