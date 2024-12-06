module Api
  module V1
    class CitiesController < BaseController
      before_action :authenticate_user!
      before_action :set_city, only: [:show]

      def index
        # Already returns a list of cities for a specific state_id (non-standard nested route)
        state = State.includes(:cities).find(params[:state_id])
        render json: state.cities, each_serializer: CitySerializer, status: :ok
      end

      def show
        render json: @city, serializer: CitySerializer, status: :ok
      end

      def all_cities
        # Returning all cities ordered
        cities = City.includes(state: :country).order('countries.abbrev ASC, states.abbrev ASC, cities.name ASC')
        render json: cities, each_serializer: CitySerializer, status: :ok
      end

      private

      def set_city
        @city = City.find(params[:id])
      end
    end
  end
end
