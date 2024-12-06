module Api
  module V1
    class ReservationsController < BaseController
      before_action :authenticate_user!

      def index
        user = User.find(params[:user_id])
        reservations = user.reservations
        # Return the reservations array (empty if no reservations)
        render json: reservations, each_serializer: ReservationSerializer, status: :ok
      end

      def create
        reservation = Reservation.new(reservation_params)
        if reservation.save
          render json: reservation, serializer: ReservationSerializer, status: :created
        else
          render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        user = User.find(params[:user_id])
        reservation = user.reservations.find(params[:id])
        reservation.destroy
        head :no_content
      end

      private

      def reservation_params
        params.require(:reservation)
          .permit(:user_id, :workspace_id, :date_reserved, :date_cancelled, :start_date,
                  :end_date, :start_time, :end_time, :city_id, :comments)
      end
    end
  end
end
