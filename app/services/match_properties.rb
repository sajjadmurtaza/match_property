# frozen_string_literal: true

class MatchProperties
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def run
    validation_error = SearchValidation.new(params).validate
    return validation_error if validation_error.present?

    result = Property.search(
      latitude: params[:lat],
      longitude: params[:lng],
      property_type: params[:property_type],
      marketing_type: params[:marketing_type]
    )

    return 'No data for given input(s)' if result.empty?

    ::MatchedProperties.serialize(result)
  end
end
