class JwtCookieAuth
  def initialize(app)
    @app = app
  end

  def call(env)
    cookie_hash = env['rack.request.cookie_hash'] || {}
    jwt_token = cookie_hash['jwt'] || extract_token_from_header(env)

    if jwt_token.present?
      Rails.logger.debug("JWT Token Found: #{jwt_token}")
      env['HTTP_AUTHORIZATION'] = "Bearer #{jwt_token}"
    else
      Rails.logger.debug("JWT Token Missing or Empty")
    end

    @app.call(env)
  end

  private

  def extract_token_from_header(env)
    auth_header = env['HTTP_AUTHORIZATION']
    auth_header&.split(' ')&.last
  end
end
