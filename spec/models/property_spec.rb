# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Property, type: :model do
  let(:property) { create :property }

  it 'has a valid factory' do
    expect(property).to be_valid
  end

  it { is_expected.to be_a(described_class) }

  it { is_expected.to validate_presence_of(:offer_type) }
  it { is_expected.to validate_presence_of(:property_type) }
  it { is_expected.to validate_presence_of(:lng) }
  it { is_expected.to validate_presence_of(:lat) }

  describe '.address' do
    it 'returns property address' do
      expect(property.address).to eq([property.street, property.city, property.zip_code].compact.join(', '))
    end
  end
end
