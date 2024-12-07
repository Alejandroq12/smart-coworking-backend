class Workspace < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :reservations, dependent: :destroy

  validates :name, :description, :model, :address, :image, :category, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :discount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
