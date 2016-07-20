class Rack::Attack
  # your custom configuration...

  Rack::Attack.throttle('req/ip', :limit => 5, :period => 1.second) do |req|
  # If the return value is truthy, the cache key for the return value
  # is incremented and compared with the limit. In this case:
  #   "rack::attack:#{Time.now.to_i/1.second}:req/ip:#{req.ip}"
  #
  # If falsy, the cache key is neither incremented nor checked.
    Rack::Attack.blocklist('block ip') do |req|
      # Requests are blocked if the return value is truthy
      req.ip
    end

    req.ip
  end
end
