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

task :update_monsters_popular => :environment do
  puts "Updating monsters..."
  [
    {
      lat: 40.707898,
      lng: -74.007579
    },
    {
      lat: 40.710923,
      lng: -74.009070
    },
    {
      lat: 40.714078,
      lng: -74.006388
    },
    {
      lat: 40.715900,
      lng: -73.999264
    },
    {
      lat: 40.716583,
      lng: -73.989136
    },
    {
      lat: 40.726129,
      lng: -73.983460
    },
    {
      lat: 40.730381,
      lng: -73.996646
    },
    {
      lat: 40.731357,
      lng: -73.998663
    },
    {
      lat: 40.736397,
      lng: -73.989908
    },
    {
      lat: 40.735275,
      lng: -73.990798
    },
    {
      lat: 40.742721,
      lng: -73.987622
    },
    {
      lat: 40.740713,
      lng: -73.989382
    }
  ].each do |c|
    Monster.request_monsters(c[:lat], c[:lng])
  end
  puts "done."
end
task :update_monsters_brooklyn => :environment do
  puts "Updating monsters..."
  [
    {
      lat: 40.670214,
      lng: -73.954782
    },
    {
      lat: 40.668326,
      lng: -73.926715
    },
    {
      lat: 40.649965,
      lng: -73.941650
    },
    {
      lat: 40.660774,
      lng: -73.974437
    },
    {
      lat: 40.668522,
      lng: -73.972463
    },
    {
      lat: 40.666178,
      lng: -73.983964
    },
    {
      lat: 40.674316,
      lng: -73.980617
    },
    {
      lat: 40.675358,
      lng: -73.917016
    }
  ].each do |c|
    Monster.request_monsters(c[:lat], c[:lng])
  end
  puts "done."
end
