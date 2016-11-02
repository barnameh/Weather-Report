require 'bundler/setup'
require 'httparty'
require 'pry'
require_relative 'weather'

class WeatherSunrise < Weather
  def feature
    "astronomy"
  end

  def sunrise
    report["sun_phase"]["sunrise"]["hour"] + ":" + report["sun_phase"]["sunrise"]["minute"]
  end

  def sunset
    report["sun_phase"]["sunset"]["hour"] + ":" + report["sun_phase"]["sunset"]["minute"]
  end

end
