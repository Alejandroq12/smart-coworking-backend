module Api
  module V1
    class UsersController < ActionController::API
      def index
        @users = User.all
        render json: @users, status: :ok, each_serializer: UserSerializer
      end
    end
  end
end
