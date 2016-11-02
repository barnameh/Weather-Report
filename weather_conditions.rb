require 'bundler/setup'
require 'httparty'
require 'pry'
require_relative 'weather'

class WeatherConditions < Weather

  def feature
    "conditions"
  end

  def location
    report['current_observation']['display_location']['full']
  end

  def observation_time
    report["current_observation"]["observation_time"]
  end

  def weather
    report['current_observation']['weather']
  end

  def temperature
    report["current_observation"]["temperature_string"]
  end

  def temp_f
    report['current_observation']['temp_f']
  end

  def wind_speed
    report['current_observation']['wind_mph']
  end

  def wind_direction
    report['current_observation']['wind_dir']
  end

  def relative_humidity
    report["current_observation"]["relative_humidity"]
  end

  def wind_string
    report["current_observation"]["wind_string"]
  end

  def feels_like
    report["current_observation"]["feelslike_string"]
  end

  def precipitation
    report["current_observation"]["precip_today_string"]
  end

  def UV_index
    report["current_observation"]["UV"]
  end

  def visibility
    report["current_observation"]["visibility_mi"]
  end

end
