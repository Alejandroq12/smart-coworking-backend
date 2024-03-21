require 'rails_helper'

RSpec.describe State, type: :model do
  describe 'associations' do
    it 'should belong to a country' do
      association = described_class.reflect_on_association(:country)
      expect(association.macro).to eq :belongs_to
    end

    it 'should have many cities' do
      association = described_class.reflect_on_association(:cities)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'should validate presence of name' do
      state = State.new
      expect(state).not_to be_valid
      expect(state.errors[:name]).to include("can't be blank")
    end
  end
end
