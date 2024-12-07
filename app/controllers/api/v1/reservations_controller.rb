module Api
  module V1
    class ReservationsController < BaseController
      before_action :authenticate_user!

      def index
        reservations = current_user.reservations.includes(workspace: :city)
        render json: reservations, each_serializer: ReservationSerializer, status: :ok
      end

      def create
        final_params = reservation_params.merge(user_id: current_user.id)
        result = ReservationCreator.new(final_params).call
        if result.is_a?(Array)
          render json: { errors: result }, status: :unprocessable_entity
        else
          render json: result, serializer: ReservationSerializer, status: :created
        end
      end

      def destroy
        reservation = current_user.reservations.find(params[:id])
        reservation.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Reservation not found' }, status: :not_found
      end

      private

      def reservation_params
        params.require(:reservation)
          .permit(:workspace_id, :start_date, :end_date, :start_time, :end_time, :comments)
      end
    end
  end
end
