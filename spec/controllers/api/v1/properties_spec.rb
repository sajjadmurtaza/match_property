# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PropertiesController, type: :controller do
  describe '#index' do
    subject(:index) { get :index, params: params }

    let(:params) do
      {
        property: {
          lng: lng,
          lat: lat,
          property_type: property_type,
          marketing_type: marketing_type
        }
      }
    end

    context 'when valid params' do
      let(:lng) { 13.4236807 }
      let(:lat) { 52.5342963 }
      let(:property_type) { 'apartment' }
      let(:marketing_type) { 'sell' }

      context 'when No data match' do
        it 'render with No Data message' do
          index

          expect(response.body).to eq 'No data for given input(s)'
        end
      end

      context 'when data match' do
        let(:property_one) { create(:property) }
        let(:property_two) { create(:property) }
        let(:property_three) { create(:property) }

        before do
          property_one
        end

        it 'return matched data' do
          index

          expect(JSON.parse(response.body).first['house_number']).to eq property_one.house_number
        end
      end
    end

    context 'when invalid params' do
      let(:lng) { 13.4236807 }
      let(:lat) { 52.5342963 }
      let(:property_type) { 'apartment' }
      let(:marketing_type) { 'sell' }

      context 'when wrong marketing_type in parms' do
        let(:marketing_type) { 'wrong_marketing_type' }

        it 'render error message' do
          index

          expect(response.body).to include 'Please provide correct marketing type e.g. rent or sell'
        end
      end

      context 'when wrong property_type in parms' do
        let(:property_type) { 'wrong_property_type' }

        it 'render error message' do
          index

          expect(response.body).to include 'Please provide correct property type e.g. apartment or single_family_house'
        end
      end

      context 'when wrong latitude and/or longitude in parms' do
        let(:lng) { 'wrong_longitude' }
        let(:lat) { 'wrong_latitude' }

        it 'render error message' do
          index

          expect(response.body).to include 'Please correct lng/lat e.g. lng: 13.42 lat: 52.53'
        end
      end
    end
  end
end
