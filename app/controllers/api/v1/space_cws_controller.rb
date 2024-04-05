module Api
  module V1
    class SpaceCwsController < ApplicationController
      before_action :set_space_cw, only: [:show]

      def index
        @coworking_spaces = SpaceCw.all

        if @coworking_spaces.any?
          render json: @coworking_spaces
        else
          render json: { message: 'No coworking spaces found.' }, status: :not_found
        end
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

      def show
        render json: { id: @space_cw.id, name: @space_cw.name }
      end

      private

      def space_cw_params
        params.require(:space_cw)
          .permit(:name, :model, :description, :address, :price, :image, :discount, :category, :user_id)
      end

      def set_space_cw
        @space_cw = SpaceCw.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Space_cw not found' }, status: :not_found
      end
    end
  end
end
