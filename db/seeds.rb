# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# créer un user
Visit.destroy_all
User.destroy_all


require 'open-uri'
require 'net/http'
require 'json'
sites_fetched = [
  {:url=>"https://www.youtube.com", :statistics=>{"url"=>"https://www.youtube.com/", "green"=>true, "bytes"=>3109418, "cleanerThan"=>0.37, "statistics"=>{"adjustedBytes"=>2347610.59, "energy"=>0.0017709700184874236, "co2"=>{"grid"=>{"grams"=>0.7827687481714413, "litres"=>0.43537597773295555}, "renewable"=>{"grams"=>0.6786357110843807, "litres"=>0.3774571825051325}}}, "timestamp"=>1670493393}},
  {:url=>"https://www.instagram.com", :statistics=>{"url"=>"https://www.instagram.com/", "green"=>true, "bytes"=>2916630, "cleanerThan"=>0.39, "statistics"=>{"adjustedBytes"=>2202055.65, "energy"=>0.0016611675512976944, "co2"=>{"grid"=>{"grams"=>0.7342360576735809, "litres"=>0.40838209527804564}, "renewable"=>{"grams"=>0.6365594056572765, "litres"=>0.35405434142657716}}}, "timestamp"=>1670492497}},
  {:url=>"https://www.twitter.com", :statistics=>{"url"=>"https://twitter.com/", "green"=>"unknown", "bytes"=>7316264, "cleanerThan"=>0.12, "statistics"=>{"adjustedBytes"=>5523779.32, "energy"=>0.0041669805061072115, "co2"=>{"grid"=>{"grams"=>1.8418053836993875, "litres"=>1.0244121544135991}, "renewable"=>{"grams"=>1.5967869299402837, "litres"=>0.8881328904327856}}}, "timestamp"=>1670492526}},
  {:url=>"https://www.linkedin.com", :statistics=>{"url"=>"https://www.linkedin.com/", "green"=>true, "bytes"=>485702, "cleanerThan"=>0.9, "statistics"=>{"adjustedBytes"=>366705.01, "energy"=>0.0002766317297704518, "co2"=>{"grid"=>{"grams"=>0.1222712245585397, "litres"=>0.06800725509945976}, "renewable"=>{"grams"=>0.10600527884803715, "litres"=>0.058960136095278254}}}, "timestamp"=>1670492544}},
  {:url=>"https://www.pinterest.com", :statistics=>{"url"=>"https://www.pinterest.com/", "green"=>true, "bytes"=>15491145, "cleanerThan"=>0.05, "statistics"=>{"adjustedBytes"=>11695814.475, "energy"=>0.008822986599756406, "co2"=>{"grid"=>{"grams"=>3.8997600770923313, "litres"=>2.1690465548787543}, "renewable"=>{"grams"=>3.380968465026655, "litres"=>1.8804946602478252}}}, "timestamp"=>1670492579}},
  {:url=>"https://www.tumblr.com", :statistics=>{"url"=>"https://www.tumblr.com/explore/trending?source=homepage_explore", "green"=>false, "bytes"=>17883037, "cleanerThan"=>0.03, "statistics"=>{"adjustedBytes"=>13501692.935, "energy"=>0.010185289454972372, "co2"=>{"grid"=>{"grams"=>4.5018979390977885, "litres"=>2.5039556337261892}, "renewable"=>{"grams"=>3.903002919145414, "litres"=>2.170850223628679}}}, "timestamp"=>1670495714}},
  {:url=>"https://www.reddit.com", :statistics=>{"url"=>"https://www.reddit.com/", "green"=>false, "bytes"=>6337457, "cleanerThan"=>0.14, "statistics"=>{"adjustedBytes"=>4784780.035, "energy"=>0.0036095006655436014, "co2"=>{"grid"=>{"grams"=>1.595399294170272, "litres"=>0.8873610874175051}, "renewable"=>{"grams"=>1.3831606550363083, "litres"=>0.7693139563311945}}}, "timestamp"=>1670492641}},
  {:url=>"https://www.netflix.com", :statistics=>{"url"=>"https://www.netflix.com/fr-en/", "green"=>true, "bytes"=>2226556, "cleanerThan"=>0.49, "statistics"=>{"adjustedBytes"=>1681049.78, "energy"=>0.0012681356834247709, "co2"=>{"grid"=>{"grams"=>0.5605159720737487, "litres"=>0.31175898366741894}, "renewable"=>{"grams"=>0.4859495938883722, "litres"=>0.2702851641207126}}}, "timestamp"=>1670495733}},
  {:url=>"https://www.amazon.com", :statistics=>{"url"=>"https://www.amazon.com/", "green"=>true, "bytes"=>3944263, "cleanerThan"=>0.29, "statistics"=>{"adjustedBytes"=>2977918.565, "energy"=>0.0022464562558103356, "co2"=>{"grid"=>{"grams"=>0.9929336650681683, "litres"=>0.5522697045109151}, "renewable"=>{"grams"=>0.8608420372265206, "litres"=>0.47880034110539066}}}, "timestamp"=>1670492689}},
  {:url=>"https://www.wedressfair.fr/", :statistics=>{"url"=>"https://www.wedressfair.fr/", "green"=>true, "bytes"=>6292023, "cleanerThan"=>0.18, "statistics"=>{"adjustedBytes"=>4750477.365, "energy"=>0.0035836237162817273, "co2"=>{"grid"=>{"grams"=>0.5839616825965235, "litres"=>0.8809994878601862}, "renewable"=>{"grams"=>1.373244608079158, "litres"=>0.7637986510136275}}}, "timestamp"=>1670492718}},
  {:url=>"https://www.airfrance.fr/", :statistics=>{"url"=>"https://www.airfrance.fr/", "green"=>true, "bytes"=>2524315, "cleanerThan"=>0.45, "statistics"=>{"adjustedBytes"=>1905857.825, "energy"=>0.0014377244173083455, "co2"=>{"grid"=>{"grams"=>0.6354741924502887, "litres"=>0.3534507458408505}, "renewable"=>{"grams"=>0.5509359967125581, "litres"=>0.3064306013715248}}}, "timestamp"=>1670430025}},
  {:url=>"https://www.rolex.com/fr", :statistics=>{"url"=>"https://www.rolex.com/fr", "green"=>true, "bytes"=>2024489, "cleanerThan"=>0.53, "statistics"=>{"adjustedBytes"=>1528489.195, "energy"=>0.0011530483588110658, "co2"=>{"grid"=>{"grams"=>0.509647374594491, "litres"=>0.28346586974945587}, "renewable"=>{"grams"=>0.4418481310964005, "litres"=>0.2457559305158179}}}, "timestamp"=>1670430173}},
  {:url=>"https://www.ikea.com/", :statistics=>{"url"=>"https://www.ikea.com/", "green"=>true, "bytes"=>1174733, "cleanerThan"=>0.72, "statistics"=>{"adjustedBytes"=>886923.415, "energy"=>0.0006690695566590876, "co2"=>{"grid"=>{"grams"=>0.2957287440433167, "litres"=>0.16448432743689273}, "renewable"=>{"grams"=>0.2563874541117624, "litres"=>0.1426027019769622}}}, "timestamp"=>1670496123}}
]

allan = User.create!(email: "allan@example.com", password: "azerty")
ines = User.create!(email: "ines@example.com", password: "azerty")
jojo = User.create!(email: "jojo@example.com", password: "azerty")
charles = User.create!(email: "charles@example.com", password: "azerty")
benjo = User.create!(email: "benjbdk@gmail.com", password: "password")

## Pour créer des visites pour aujourd'hui et les 30 derniers jours
User.all.each do |user|
  31.times do |i|
    date = i.day.ago

    sites_fetched.each do |site|
      duration = rand(600..10800) ## permet de créer des sessions entre 10 minutes to 3 hours

      visit = Visit.create!(
        created_at: date,
        end_time: date + duration,
        url: site[:url],
        cleaner_than: site[:statistics]["cleanerThan"],
        green: site[:statistics]["green"],
        bytes: site[:statistics]["bytes"],
        statistics: site[:statistics]["statistics"],
        user: user
      )
      ap visit
    end
  end
end
