# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

Trail.destroy_all
User.destroy_all
Hike.destroy_all

hike_key = ENV['hike_api_key']

co_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=10&key=#{hike_key}"
co_result = JSON.parse(co_result)["trails"]

yosemite_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=37.7326&lon=-119.6086&maxDistance=10&key=#{hike_key}"
yosemite_result = JSON.parse(yosemite_result)["trails"]

mo_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=37.596824&lon=-91.838940&key=#{hike_key}"
mo_result = JSON.parse(mo_result)["trails"]

yellowstone_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=44.443830&lon=-110.800901&maxDistance=10&key=#{hike_key}"
yellowstone_result = JSON.parse(yellowstone_result)["trails"]

teton_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=43.8536&lon=-110.6314&maxDistance=10&key=#{hike_key}"
teton_result = JSON.parse(teton_result)["trails"]

grandcanyon_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=36.1070&lon=-112.1130&maxDistance=10&key=#{hike_key}"
grandcanyon_result = JSON.parse(grandcanyon_result)["trails"]

arches_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=38.7331&lon=-109.5925&maxDistance=10&key=#{hike_key}"
arches_result = JSON.parse(arches_result)["trails"]

smokies_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=35.6532&lon=-83.5070&maxDistance=10&key=#{hike_key}"
smokies_result = JSON.parse(smokies_result)["trails"]

zion_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=37.317207&lon=-113.022537&maxDistance=10&key=#{hike_key}"
zion_result = JSON.parse(zion_result)["trails"]

catskill_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=42.408810&lon=-74.617889&maxDistance=10&key=#{hike_key}"
catskill_result = JSON.parse(catskill_result)["trails"]

boise_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=45.584251&lon=-115.297593&maxDistance=10&key=#{hike_key}"
boise_result = JSON.parse(boise_result)["trails"]

seattle_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=47.547799&lon=-122.335884&maxDistance=10&key=#{hike_key}"
seattle_result = JSON.parse(seattle_result)["trails"]

jacksonhole_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=43.582767&lon=-110.821999&maxDistance=10&key=#{hike_key}"
jacksonhole_result = JSON.parse(jacksonhole_result)["trails"]

trails_array = co_result + yosemite_result + mo_result + yellowstone_result + teton_result + grandcanyon_result + arches_result + smokies_result + zion_result + catskill_result + boise_result + seattle_result + jacksonhole_result
trails_array.each do |trail|
    Trail.create(
        name: trail["name"],
        # type: trail["type"],
        summary: trail["summary"],
        length: trail["length"],
        ascent: trail["ascent"],
        descent: trail["descent"],
        difficulty: trail["difficulty"],
        location: trail["location"],
        url: trail["url"],
        img_sq_small: trail["imgSqSmall"],
        img_small: trail["imgSmall"],
        img_small_med: trail["imgSmallMed"],
        img_medium: trail["imgMedium"],
        trail_api_id: trail["id"],
        condition_status: trail["conditionStatus"],
        condition_details: trail["conditionDetails"],
        longitude: trail["longitude"],
        latitude: trail["latitude"]
    )
end


mary = User.create(username: "outdoorsyChick1", password: "password", first_name: "Mary", last_name: "Kang", outdoorsiness_scale: 5)
linds = User.create(username: "outdoorsyChick2", password: "password", first_name: "Lindsay", last_name: "Montgomery", outdoorsiness_scale: 4)

hike1 = Hike.create(user: mary, trail: Trail.all.last, completed: true, rating: 5, favorite: true)
hike2 = Hike.create(user: linds, trail: Trail.all.first, completed: false)
hike3 = Hike.create(user: mary, trail: Trail.all.first, completed: false)


# api_result = RestClient::Request.execute(method: :get, 
#                                             url: "https://hikingproject.com/data/get-trails", 
#                                             key: '200766398-4923424b5e4da02910173b9c11be75c6',
#                                             lat: 40.0274,
#                                             lon:-105.2519)



