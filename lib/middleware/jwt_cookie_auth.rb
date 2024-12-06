class JwtCookieAuth
  def initialize(app)
    @app = app
  end

  def call(env)
    cookie_hash = env['rack.request.cookie_hash'] || {}
    jwt_token = cookie_hash['jwt']

    if jwt_token.present?
      Rails.logger.debug("JWT Cookie Found: #{jwt_token}")
      env['HTTP_AUTHORIZATION'] = "Bearer #{jwt_token}"
    else
      Rails.logger.debug("JWT Cookie Missing or Empty")
    end

    @app.call(env)
  end
end
