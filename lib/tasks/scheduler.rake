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
    },
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

task :update_monsters_les_queens_bk => :environment do
  puts "Updating monsters..."
  [
    {
      lat: 40.720714,
      lng: -73.981475
    },
    {
      lat: 40.721308,
      lng: -73.987848
    },
    {
      lat: 40.716738,
      lng: -73.989125
    },
    {
      lat: 40.714583,
      lng: -73.981647
    },
    {
      lat: 40.714428,
      lng: -73.992676
    },
    {
      lat: 40.717745,
      lng: -73.985033
    },
    {
      lat: 40.720648,
      lng: -73.986020
    },
    {
      lat: 40.755898,
      lng: -73.785464
    },
    {
      lat: 40.757662,
      lng: -73.779316
    },
    {
      lat: 40.746576,
      lng: -73.809335
    },
    {
      lat: 40.762505,
      lng: -73.804357
    },
    {
      lat: 40.771736,
      lng: -73.768480
    },
    {
      lat: 40.770956,
      lng: -73.778951
    },
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

task :update_monsters_east => :environment do
  puts "Updating monsters..."
  [
    {
      lat: 40.727999,
      lng: -73.982731
    },
    {
      lat: 40.729145,
      lng: -73.987334
    },
    {
      lat: 40.726446,
      lng: -73.986197
    },
    {
      lat: 40.730479,
      lng: -73.980318
    },
    {
      lat: 40.736662,
      lng: -73.981906
    },
    {
      lat: 40.742100,
      lng: -73.982646
    },
    {
      lat: 40.745628,
      lng: -73.980232
    },
    {
      lat: 40.749651,
      lng: -73.979363
    },
    {
      lat: 40.752162,
      lng: -73.973569
    },
    {
      lat: 40.755072,
      lng: -73.971069
    },
    {
      lat: 40.760273,
      lng: -73.967657
    },
    {
      lat: 40.765969,
      lng: -73.967335
    },
    {
      lat: 40.742697,
      lng: -73.987795
    },
    {
      lat: 40.767305,
      lng: -73.993981
    },
    {
      lat: 40.762867,
      lng:-73.993274
    },
    {
      lat: 40.760819,
      lng: -73.998284
    },
    {
      lat: 40.755187,
      lng:  -74.000591
    },
    {
      lat: 40.756528,
      lng: -73.990345
    },
    {
      lat: 40.754114,
      lng: -73.992126
    },
    {
      lat: 40.761420,
      lng: -73.988489
    },
    {
      lat: 40.755394,
      lng:  -73.987576
    },
    {
      lat: 0.746706,
      lng:-73.997811
    },
    {
      lat: 40.742886,
      lng: -74.004055
    },
    {
      lat: 40.749701,
      lng: -74.002763
    },
    {
      lat: 40.739477,
      lng: -74.002795
    }
  ].each do |c|
    Monster.request_monsters(c[:lat], c[:lng])
  end
  puts "done."
end
task :update_monsters_upper => :environment do
  puts "Updating monsters..."
  [
    {
      lat: 40.814706,
      lng: -73.926391
    },
    {
      lat: 40.811913,
      lng: -73.914032
    },
    {
      lat: 40.819253,
      lng: -73.910255
    },
    {
      lat: 40.826917,
      lng: -73.922615
    },
    {
      lat: 40.821072,
      lng: -73.899011
    },
    {
      lat: 40.829060,
      lng: -73.906736
    },
    {
      lat: 40.840490,
      lng: -73.906994
    },
    {
      lat: 40.841139,
      lng: -73.894634
    },
    {
      lat: 40.852436,
      lng: -73.903818
    },
    {
      lat: 40.863537,
      lng: -73.896952
    },
    {
      lat: 40.895920,
      lng: -73.893175
    },
    {
      lat: 40.905132,
      lng: -73.894462
    },
    {
      lat: 40.903575,
      lng: -73.881416
    },
    {
      lat: 40.893390,
      lng: -73.873691
    },
    {
      lat: 40.879114,
      lng: -73.875751
    },
    {
      lat: 40.809379,
      lng: -73.962526
    },
    {
      lat: 40.803402,
      lng: -73.964243
    },
    {
      lat: 40.827044,
      lng: -73.951795
    },
    {
      lat: 40.823780,
      lng: -73.944092
    }
  ].each do |c|
    Monster.request_monsters(c[:lat], c[:lng])
  end
  puts "done."
end
