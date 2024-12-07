class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  # Validations: ensure start_date, end_date, start_time, end_time presence and logical correctness
  validates :start_date, :end_date, :start_time, :end_time, presence: true
  validate :end_date_after_start_date
  validate :end_time_after_start_time

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, 'must be after start_date') if end_date < start_date
  end

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    # If on the same day, ensure end_time is after start_time
    return unless start_date == end_date && end_time <= start_time

    errors.add(:end_time, 'must be after start_time on the same day')
  end
end
