require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'associations' do
    it 'should have many states' do
      association = described_class.reflect_on_association(:states)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'should validate presence of name' do
      country = Country.new
      expect(country).not_to be_valid
      expect(country.errors[:name]).to include("can't be blank")
    end
  end
end
