require 'rails_helper'

RSpec.describe SpaceCw, type: :model do
  describe "associations" do
    it "should belong to a user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it "should have many reservations" do
      association = described_class.reflect_on_association(:reservations)
      expect(association.macro).to eq :has_many
    end
  end

  describe "validations" do
    it "should validate presence of name" do
      space_cw = SpaceCw.new(description: "Test Description")
      expect(space_cw).not_to be_valid
      expect(space_cw.errors[:name]).to include("can't be blank")
    end

    it "should validate presence of description" do
      space_cw = SpaceCw.new(name: "Test Name")
      expect(space_cw).not_to be_valid
      expect(space_cw.errors[:description]).to include("can't be blank")
    end

    it "should validate numericality of price" do
      space_cw = SpaceCw.new(name: "Test Name", description: "Test Description", price: "not_a_number")
      expect(space_cw).not_to be_valid
      expect(space_cw.errors[:price]).to include("is not a number")

      space_cw.price = -1
      expect(space_cw).not_to be_valid
      expect(space_cw.errors[:price]).to include("must be greater than or equal to 0")
    end

    it "should validate numericality of discount" do
      space_cw = SpaceCw.new(name: "Test Name", description: "Test Description", discount: "not_a_number")
      expect(space_cw).not_to be_valid
      expect(space_cw.errors[:discount]).to include("is not a number")

      space_cw.discount = -1
      expect(space_cw).not_to be_valid
      expect(space_cw.errors[:discount]).to include("must be greater than or equal to 0")
    end
  end
end
