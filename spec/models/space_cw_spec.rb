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
end
