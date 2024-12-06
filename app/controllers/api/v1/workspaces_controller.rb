module Api
  module V1
    class WorkspacesController < BaseController
      before_action :authenticate_user!
      before_action :set_workspace, only: [:show, :destroy]

      def index
        reserved_space_ids = Reservation.select(:space_cw_id).distinct.pluck(:space_cw_id)
        workspaces = SpaceCw.where.not(id: reserved_space_ids)

        # Return empty array if none found, not a not_found status, as empty is a valid state.
        render json: workspaces, each_serializer: WorkspaceSerializer, status: :ok
      end

      def create
        workspace = SpaceCw.new(workspace_params)
        if workspace.save
          render json: workspace, serializer: WorkspaceSerializer, status: :created
        else
          render json: { errors: workspace.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @workspace.destroy
        head :no_content
      end

      def show
        render json: @workspace, serializer: WorkspaceSerializer, status: :ok
      end

      private

      def workspace_params
        params.require(:space_cw).permit(:name, :model, :description, :address, :price, :image, :discount, :category, :user_id)
      end

      def set_workspace
        @workspace = SpaceCw.find(params[:id])
      end
    end
  end
end
