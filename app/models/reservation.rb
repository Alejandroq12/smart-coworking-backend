class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :workspace
  belongs_to :city
  validates :date_reserved, :start_date, :end_date, presence: true
end
