Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://smart-coworking-857b32bb5cda.herokuapp.com', 'https://alejandroq12.github.io', 'localhost:3000', '127.0.0.1:3000'

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             credentials: true
  end
end
