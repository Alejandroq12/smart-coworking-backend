module Api
  module V1
    class WorkspacesController < BaseController
      before_action :authenticate_user!
      before_action :set_workspace, only: %i[show destroy]

      def index
        reserved_workspace_ids = Reservation.distinct.pluck(:workspace_id)
        workspaces = Workspace.where.not(id: reserved_workspace_ids)
        render json: workspaces, each_serializer: WorkspaceSerializer, status: :ok
      end

      def create
        workspace = Workspace.new(workspace_params)
        if workspace.save
          render json: workspace, serializer: WorkspaceSerializer, status: :created
        else
          render json: { errors: workspace.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: @workspace, serializer: WorkspaceSerializer, status: :ok
      end

      def destroy
        @workspace.destroy
        head :no_content
      end

      private

      def workspace_params
        params.require(:workspace).permit(:name, :model, :description, :address, :price, :image, :discount, :category, :user_id)
      end

      def set_workspace
        @workspace = Workspace.find(params[:id])
      end
    end
  end
end
