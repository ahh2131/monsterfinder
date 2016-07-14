namespace :json do
  desc "TODO"
  task create: :environment do

    events_json = []
    Monster.all.each do |event|
      event_json = {
        "id" => event.id,
        "created_at" => event.created_at,
        "name" => event.name,
        "number" => event.number,
        "lat" => event.lat,
        "lng" => event.lng
      }
      events_json << event_json
    end
    File.open("public/monsters.json","w") do |f|
      f.write(events_json.to_json)
    end
  end

end
