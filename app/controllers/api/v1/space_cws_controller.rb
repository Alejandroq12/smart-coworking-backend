module Api
  module V1
    class SpaceCwsController < ApplicationController
      def index
        user = User.find(params[:user_id])
        space_cws = user.space_cws

        if space_cws.any?
          render json: space_cws
        else
          render json: { message: 'No coworking spaces found for this user' }, status: :not_found
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :not_found
      end

      def new
        space_cw = SpaceCw.new
        render json: space_cw
      end

      def create
        space_cw = SpaceCw.new(space_cw_params)
        if space_cw.save
          render json: space_cw, status: :created
        else
          render json: space_cw.errors, status: :unprocessable_entity
        end
      end

      def destroy
        space_cw = SpaceCw.find(params[:id])
        space_cw.destroy
        head :no_content
      end

      private

      def space_cw_params
        params.require(:space_cw)
          .permit(:name, :model, :description, :address, :price, :image, :discount, :category, :user_id)
      end
    end
  end
end