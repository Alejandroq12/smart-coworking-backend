class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  # Login: Set JWT in cookie
  def respond_with(resource, _opts = {})
    token = request.env['warden-jwt_auth.token']
    set_jwt_cookie(token)
    render json: { user: resource }, status: :ok
  end

  # Logout: Clear JWT cookie
  def respond_to_on_destroy
    clear_jwt_cookie
    head :no_content
  end

  def set_jwt_cookie(token)
    cookies.signed[:jwt] = {
      value: token,
      httponly: true, # Prevent JavaScript access
      secure: Rails.env.production?, # Only send over HTTPS in production
      same_site: :lax, # Required for cross-origin requests
      expires: 1.day.from_now
    }
  end

  def clear_jwt_cookie
    cookies.delete(:jwt, secure: Rails.env.production?)
  end
end
