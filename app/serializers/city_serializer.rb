class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :state_id, :state_name, :country_abbrev

  def state_name
    object.state.name
  end

  def country_abbrev
    object.state.country.abbrev
  end
end
