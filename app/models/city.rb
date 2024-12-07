class City < ApplicationRecord
  belongs_to :state
  has_many :workspaces, dependent: :destroy
  validates :name, presence: true
end
