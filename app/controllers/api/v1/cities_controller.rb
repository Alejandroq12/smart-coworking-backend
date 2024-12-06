module Api
  module V1
    class CitiesController < BaseController
      before_action :authenticate_user!
      before_action :set_city, only: [:show]

      def index
        if params[:state_id]
          # Filter cities by given state_id
          state = State.find(params[:state_id])
          cities = state.cities.includes(state: :country).order('countries.abbrev ASC, states.abbrev ASC, cities.name ASC')
        else
          # Return all cities if no state_id given
          cities = City.includes(state: :country).order('countries.abbrev ASC, states.abbrev ASC, cities.name ASC')
        end

        render json: cities, each_serializer: CitySerializer, status: :ok
      end

      def show
        render json: @city, serializer: CitySerializer, status: :ok
      end

      private

      def set_city
        @city = City.find(params[:id])
      end
    end
  end
end
