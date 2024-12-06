module Api
  module V1
    class UsersController < BaseController
      before_action :authenticate_user!

      def index
        users = User.all
        render json: users, each_serializer: UserSerializer, status: :ok
      end
    end
  end
end
