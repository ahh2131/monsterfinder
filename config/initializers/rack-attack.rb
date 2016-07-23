class Rack::Attack
  # your custom configuration...

#  Rack::Attack.throttle('req/ip', :limit => 100, :period => 10.minutes) do |req|
  # If the return value is truthy, the cache key for the return value
  # is incremented and compared with the limit. In this case:
  #   "rack::attack:#{Time.now.to_i/1.second}:req/ip:#{req.ip}"
  #
  # If falsy, the cache key is neither incremented nor checked.
#    Rails.cache.write("block #{req.ip}", true, expires_in: 5.days)

#    req.ip
#  end

  #Rack::Attack.blacklist('block <ip>') do |req|
    # if variable `block <ip>` exists in cache store, then we'll block the request
  #  Rails.cache.fetch("block #{req.ip}").present?
  #end
end
