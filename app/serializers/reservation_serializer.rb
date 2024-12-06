class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :space_cw_id, :city_id, :date_reserved, :start_date, :end_date, :start_time, :end_time, :comments
end
