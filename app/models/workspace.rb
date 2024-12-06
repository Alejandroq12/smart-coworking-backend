class Workspace < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, :description, presence: true
  validates :model, :address, presence: true
  validates :price, :discount, numericality: { greater_than_or_equal_to: 0 }
end
