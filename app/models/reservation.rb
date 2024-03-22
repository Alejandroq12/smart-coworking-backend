class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :space_cw
  belongs_to :city
  validates :date_reserved, :start_date, :end_date, presence: true
end
