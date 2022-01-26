# frozen_string_literal: true

class SearchValidation
  attr_accessor :params, :errors

  def initialize(params)
    @params = params
    @errors = []
  end

  def validate
    validate_property_type
    validate_marketing_type
    validate_address

    errors
  end

  private

  def valid_property_type?
    %w[apartment single_family_house].include? params[:property_type]
  end

  def valid_marketing_type?
    %w[rent sell].include? params[:marketing_type]
  end

  def valid_longitude?
    params[:lng].to_f > 0.0
  end

  def valid_latitude?
    params[:lat].to_f > 0.0
  end

  def validate_property_type
    return if valid_property_type?

    errors << 'Please provide correct property type e.g. apartment or single_family_house'
  end

  def validate_marketing_type
    return if valid_marketing_type?

    errors << 'Please provide correct marketing type e.g. rent or sell'
  end

  def validate_address
    return if valid_longitude? && valid_latitude?

    errors << 'Please correct lng/lat e.g. lng: 13.42 lat: 52.53'
  end
end
