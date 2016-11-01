require 'bundler/setup'
require 'httparty'
require 'pry'

class WeatherAlert
  BASE_URI = "http://api.wunderground.com/api/#{ENV['WEATHER_UNDERGROUND_API_KEY']}/"
  QUERY_TYPE = "alert/q/"
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
    response["alerts"].each do |t|
      puts t["description"]
      print "from: "
      puts t["date"]
      print "to: "
      puts t["expires"]
      puts t["message"]
    end
  end
end