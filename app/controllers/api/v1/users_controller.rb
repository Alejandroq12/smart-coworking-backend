module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!

      def index
        @users = User.all
        render json: @users, status: :ok, each_serializer: UserSerializer
      end
    end
  end
end
