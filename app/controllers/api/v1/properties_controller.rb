# frozen_string_literal: true

module Api
  module V1
    class PropertiesController < ApplicationController
      def index
        result = ::MatchProperties.new(search_params).run

        render json: result
      end

      private

      def search_params
        params.require(:property).permit(:lng, :lat, :property_type, :marketing_type)
      end
    end
  end
end
