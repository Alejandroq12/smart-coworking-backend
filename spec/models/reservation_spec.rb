require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe "associations" do
    it "should belong to a user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it "should belong to a space_cw" do
      association = described_class.reflect_on_association(:space_cw)
      expect(association.macro).to eq :belongs_to
    end

    it "should belong to a city" do
      association = described_class.reflect_on_association(:city)
      expect(association.macro).to eq :belongs_to
    end
  end
end
