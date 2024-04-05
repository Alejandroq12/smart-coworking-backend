class Rack::Attack
  throttle('req/ip', limit: 60, period: 5.minutes) do |req|
    req.ip
  end
end
