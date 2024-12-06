class Country < ApplicationRecord
  has_many :states, dependent: :destroy
  validates :name, :abbrev, presence: true
end
