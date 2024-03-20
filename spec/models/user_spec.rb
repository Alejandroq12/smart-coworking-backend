require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it "should have many space_cws" do
      association = described_class.reflect_on_association(:space_cws)
      expect(association.macro).to eq :has_many
    end
  end

  

  describe "methods" do
    let(:user) { User.create(name: "testuser", email: "test@example.com") }

    it "returns the name" do
      expect(user.name).to eq("testuser")
    end

    it "returns the email" do
      expect(user.email).to eq("test@example.com")
    end
  end
end
