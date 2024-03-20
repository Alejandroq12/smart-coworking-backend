require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it "should have many space_cws" do
      association = described_class.reflect_on_association(:space_cws)
      expect(association.macro).to eq :has_many
    end
  end
end
