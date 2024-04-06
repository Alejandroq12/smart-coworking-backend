module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :authenticate_user!

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

      def create
        reservation = Reservation.new(reservation_params)
        if reservation.save
          render json: reservation, status: :created
        else
          render json: reservation.errors, status: :unprocessable_entity
        end
      end

      def destroy
        user = User.find(params[:user_id])
        reservation = user.reservations.find(params[:id])
        reservation.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Reservation not found' }, status: :not_found
      end

      private

      def reservation_params
        params.require(:reservation)
          .permit(:user_id, :space_cw_id, :date_reserved, :date_cancelled, :start_date,
                  :end_date, :start_time, :end_time, :city_id, :comments)
      end
    end
  end
end
