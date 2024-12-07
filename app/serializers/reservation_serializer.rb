class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :workspace_id, :start_date, :end_date, :start_time, :end_time, :comments, :created_at,
             :updated_at, :workspace_name, :city_name

  belongs_to :user
  belongs_to :workspace

  attribute :workspace_name do
    object.workspace&.name
  end

  attribute :city_name do
    object.workspace&.city&.name || 'N/A'
  end
end
