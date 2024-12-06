class StateSerializer < ActiveModel::Serializer
  attributes :id, :name, :abbrev, :country_id
end
