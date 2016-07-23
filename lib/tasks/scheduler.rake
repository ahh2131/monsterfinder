desc "This task is called by the Heroku scheduler add-on"
task :update_monsters => :environment do
  puts "Updating monsters..."
  [
    # central park
    {
      lat: 40.7140535395972,
      lng: -73.9873472136203
    },
    {
      lat: 40.764283,
      lng: -73.973015
    },
    {
      lat: 40.767176,
      lng: -73.976770
    },
    {
      lat: 40.768671,
      lng: -73.979903
    },
    {
      lat: 40.770524,
      lng: -73.978841
    },
    {
      lat: 40.769200,
      lng: -73.976856
    },
    {
      lat: 40.768964,
      lng: -73.972768
    },
    {
      lat: 40.770914,
      lng: -73.972800
    },
    {
      lat: 40.771905,
      lng: -73.975600
    },
    {
      lat:40.772506,
      lng: -73.972789
    }
  ].each do |c|
    Monster.request_monsters(c[:lat], c[:lng])
  end
  puts "done."
end
