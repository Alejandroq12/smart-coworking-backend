require_relative "boot"
require_relative "../lib/middleware/jwt_cookie_auth"
require "rails/all"

Bundler.require(*Rails.groups)

module BookAnAppointmentBackEndMvFinalCapstone
  class Application < Rails::Application
    # Enable cookies and sessions middleware
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    # Use the JwtCookieAuth middleware
    config.middleware.use JwtCookieAuth

    # Allow API-only mode with session and cookies support
    config.api_only = true
  end
end

