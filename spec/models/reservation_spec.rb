require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'associations' do
    it 'should belong to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'should belong to a workspace' do
      association = described_class.reflect_on_association(:workspace)
      expect(association.macro).to eq :belongs_to
    end

    it 'should belong to a city' do
      association = described_class.reflect_on_association(:city)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe 'validations' do
    it 'should validate presence of date_reserved' do
      reservation = Reservation.new(start_date: Date.today, end_date: Date.today)
      expect(reservation).not_to be_valid
      expect(reservation.errors[:date_reserved]).to include("can't be blank")
    end

    it 'should validate presence of start_date' do
      reservation = Reservation.new(date_reserved: Date.today, end_date: Date.today)
      expect(reservation).not_to be_valid
      expect(reservation.errors[:start_date]).to include("can't be blank")
    end

    it 'should validate presence of end_date' do
      reservation = Reservation.new(date_reserved: Date.today, start_date: Date.today)
      expect(reservation).not_to be_valid
      expect(reservation.errors[:end_date]).to include("can't be blank")
    end
  end
end
