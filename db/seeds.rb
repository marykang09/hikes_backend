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

api_result = RestClient.get "https://www.hikingproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=10&key=200766398-4923424b5e4da02910173b9c11be75c6"

trails_array = JSON.parse(api_result)["trails"]

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
        condition_details: trail["conditionDetails"]
    )
end

mary = User.create(username: "outdoorsyChick1", first_name: "Mary", last_name: "Kang", outdoorsiness_scale: 5)
linds = User.create(username: "outdoorsyChick2", first_name: "Lindsay", last_name: "Montgomery", outdoorsiness_scale: 4)

hike1 = Hike.create(user: mary, trail: Trail.all.last, completed: true, rating: 5, favorite: true)
hike2 = Hike.create(user: linds, trail: Trail.all.first, completed: false)
hike3 = Hike.create(user: mary, trail: Trail.all.first, completed: false)


# api_result = RestClient::Request.execute(method: :get, 
#                                             url: "https://hikingproject.com/data/get-trails", 
#                                             key: '200766398-4923424b5e4da02910173b9c11be75c6',
#                                             lat: 40.0274,
#                                             lon:-105.2519)



