class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    token = request.env['warden-jwt_auth.token']
    set_jwt_cookie(token)
    render json: { user: resource }, status: :ok
  end

  def respond_to_on_destroy
    cookies.delete(:jwt, domain: :all, secure: Rails.env.production?)
    head :no_content
  end

  def set_jwt_cookie(token)
    cookies.signed[:jwt] = {
      value: token,
      httponly: true, # True in production, false in development
      secure: true, # True in production, false in development
      same_site: :lax,
      domain: Rails.env.production? ? 'alejandroq12.github.io' : :all,
      expires: 1.day.from_now
    }
  end
  
end
