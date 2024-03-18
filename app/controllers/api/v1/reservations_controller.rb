module Api
  module V1
    class ReservationsController < ApplicationController
      def index
        user = User.find(params[:user_id])
        reservations = user.reservations

        if reservations.any?
          render json: reservations, status: :ok
        else
          render json: { message: 'User has no reservations' }, status: :ok
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :not_found
      end
    end
  end
end
