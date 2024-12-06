module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    # On successful registration, send the JWT in an HTTPOnly cookie
    def respond_with(resource, _opts = {})
      if resource.persisted?
        token = request.env['warden-jwt_auth.token']
        set_jwt_cookie(token)
        render json: { user: resource }, status: :created
      else
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # Helper method to set JWT as an HTTPOnly cookie
    def set_jwt_cookie(token)
      cookies.signed[:jwt] = {
        value: token,
        httponly: Rails.env.production?, # True in production, false in development
        secure: Rails.env.production?, # True in production, false in development
        same_site: :lax,
        expires: 1.day.from_now
      }
    end
  end
end
