Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://alejandroq12.github.io', 'localhost:3000', '127.0.0.1:3000'

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             credentials: true
  end
end
