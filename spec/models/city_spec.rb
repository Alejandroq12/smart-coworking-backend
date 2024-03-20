require 'rails_helper'

RSpec.describe City, type: :model do
  describe "associations" do
    it "should belong to a state" do
      association = described_class.reflect_on_association(:state)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe "validations" do
    it "should validate presence of name" do
      city = City.new
      expect(city).not_to be_valid
      expect(city.errors[:name]).to include("can't be blank")
    end
  end
end
