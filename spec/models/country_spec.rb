require 'rails_helper'

RSpec.describe Country, type: :model do
  describe "associations" do
    it "should have many states" do
      association = described_class.reflect_on_association(:states)
      expect(association.macro).to eq :has_many
    end
  end
end
