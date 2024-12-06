require 'rails_helper'

RSpec.describe Workspace, type: :model do
  describe 'associations' do
    it 'should belong to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'should have many reservations' do
      association = described_class.reflect_on_association(:reservations)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'should validate presence of name' do
      workspaces = Workspace.new(description: 'Test Description')
      expect(workspaces).not_to be_valid
      expect(workspaces.errors[:name]).to include("can't be blank")
    end

    it 'should validate presence of description' do
      workspace = Workspace.new(name: 'Test Name')
      expect(workspace).not_to be_valid
      expect(workspace.errors[:description]).to include("can't be blank")
    end

    it 'should validate numericality of price' do
      workspace= Workspace.new(name: 'Test Name', description: 'Test Description', price: 'not_a_number')
      expect(workspace).not_to be_valid
      expect(workspace.errors[:price]).to include('is not a number')

      workspace.price = -1
      expect(workspace).not_to be_valid
      expect(workspace.errors[:price]).to include('must be greater than or equal to 0')
    end

    it 'should validate numericality of discount' do
      workspace = Workspace.new(name: 'Test Name', description: 'Test Description', discount: 'not_a_number')
      expect(workspace).not_to be_valid
      expect(workspace.errors[:discount]).to include('is not a number')

      workspace.discount = -1
      expect(workspace).not_to be_valid
      expect(workspace.errors[:discount]).to include('must be greater than or equal to 0')
    end
  end
end
