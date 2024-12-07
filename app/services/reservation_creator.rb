class ReservationCreator
  def initialize(params)
    @params = params
  end

  def call
    Reservation.create!(@params)
  rescue ActiveRecord::RecordInvalid => e
    e.record.errors.full_messages
  end
end
