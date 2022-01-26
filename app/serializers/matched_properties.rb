# frozen_string_literal: true

class MatchedProperties
  attr_accessor :property

  def initialize(property)
    @property = property
  end

  def self.serialize(properties)
    properties.map { |property| new(property).serialize }
  end

  def serialize
    {
      house_number: property.house_number,
      street: property.street,
      city: property.city,
      zip_code: property.zip_code,
      lat: property.lat,
      lng: property.lng,
      price: property.price,
      distance: property.distance, # number of miles from the search point to this object
      bearing: property.bearing # direction from the search point to this object
    }
  end
end
