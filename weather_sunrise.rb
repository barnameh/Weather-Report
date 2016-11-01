require 'bundler/setup'
require 'httparty'
require 'pry'

class WeatherSunrise
  BASE_URI = "http://api.wunderground.com/api/#{ENV['WEATHER_UNDERGROUND_API_KEY']}/"
  QUERY_TYPE = "astronomy/q/"
  def get(state, city)
    city_name = city.split.join("_")
    response = HTTParty.get("#{BASE_URI}#{QUERY_TYPE}#{state}#{city_name}.json")
    extract_and_display_data(response)
    #binding pry
  end

  def get_by_zip(zipcode)
    response = HTTParty.get("#{BASE_URI}#{QUERY_TYPE}#{zipcode}.json")
    extract_and_display_data(response)
    response
    #binding pry
  end

  def extract_and_display_data(response)
    print "Sunrise: "
    print response["sun_phase"]["sunrise"]["hour"]
    print ":"
    puts response["sun_phase"]["sunrise"]["minute"]
    print "Sunset: "
    print response["sun_phase"]["sunset"]["hour"]
    print ":"
    puts response["sun_phase"]["sunset"]["minute"]
    puts " "

  end
end
