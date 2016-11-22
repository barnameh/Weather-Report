require_relative 'weather_alerts'
require_relative 'weather_conditions'
require_relative 'weather_sunrise'
require_relative 'weather_ten_day'

require 'pry'

class WeatherReport
  def get_zip
    gets.chomp
  end

  def run!
      puts "Weather Report"
      puts "Please enter zip code"
      zip_code = get_zip

      conditions = WeatherConditions.new(zip_code)
      alerts = WeatherAlerts.new(zip_code)
      sunrise = WeatherSunrise.new(zip_code)
      ten_day_forecast = WeatherTenDay.new(zip_code)

      print "Location: "
      puts conditions.location
      print "Ovservation Time: "
      puts conditions.observation_time
      print "Weather: "
      puts conditions.weather
      print "Temperature: "
      puts conditions.temperature
      print "Relative Humidity: "
      puts conditions.relative_humidity
      print "Wind: "
      puts conditions.wind_string
      print "  Direction: "
      print conditions.wind_direction
      print "  Speed: "
      puts conditions.wind_speed
      print "Feels like: "
      puts conditions.feels_like
      print "Precipitation: "
      puts conditions.precipitation
      print "UV Index: "
      puts conditions.UV_index
      print "Visibility: "
      puts conditions.visibility
      puts " "

      puts "Ten day forecast:"
      ten_day_forecast.day_titles.each_index do |i|
        print ten_day_forecast.day_titles[i]
        print " :"
        puts ten_day_forecast.day_forcasts[i]
        puts " "
      end

      puts " "
      print "Sunrise: "
      puts sunrise.sunrise
      print "Sunset: "
      puts sunrise.sunset

      for i in 0..(alerts.number_of_alerts - 1)
        puts alerts.descriptions[i]
        print "From: "
        puts alerts.from_dates[i]
        print "To: "
        puts alerts.expire_dates[i]
        puts " "
        puts alerts.messages[i]
      end
  end
end

WeatherReport.new.run! if __FILE__ == $PROGRAM_NAME
