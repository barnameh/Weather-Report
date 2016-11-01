require 'bundler/setup'
require 'httparty'
require 'pry'

#conditions
#http://api.wunderground.com/api/370f0daf09ad3f12/conditions/q/20037.json

class WeatherCondition
  BASE_URI = "http://api.wunderground.com/api/#{ENV['WEATHER_UNDERGROUND_API_KEY']}/"
  QUERY_TYPE = "conditions/q/"
  def get(state, city)
    city_name = city.split.join("_")
    response = HTTParty.get("#{BASE_URI}#{QUERY_TYPE}#{state}/#{city_name}.json")
    extract_and_display_data(response)
  end

  def get_by_zip(zipcode)
    response = HTTParty.get("#{BASE_URI}#{QUERY_TYPE}#{zipcode}.json")
    extract_and_display_data(response)
  end

  def extract_and_display_data(response)
    print "Location: "
    #binding.pry
    puts response["current_observation"]["display_location"]["full"] # city, state
    print "Ovservation Time: "
    puts response["current_observation"]["observation_time"]
    print "Weather: "
    puts response["current_observation"]["weather"] #e.g. mostly cloudy
    print "Temperature: "
    puts response["current_observation"]["temperature_string"]
    print "Relative Humidity: "
    puts response["current_observation"]["relative_humidity"]
    print "Wind: "
    print response["current_observation"]["wind_string"]
    print "  Direction: "
    print response["current_observation"]["wind_dir"]
    print "  Speed: "
    puts response["current_observation"]["wind_mph"]
    print "Feels like: "
    puts response["current_observation"]["feelslike_string"]
    print "Precipitation: "
    puts response["current_observation"]["precip_today_string"]
    print "UV Index: "
    puts response["current_observation"]["UV"] # UV index
    print "Visibility: "
    puts response["current_observation"]["visibility_mi"]
    puts " "
  end
end
