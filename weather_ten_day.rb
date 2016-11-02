require 'bundler/setup'
require 'httparty'
require 'pry'
require_relative 'weather'

class WeatherTenDay < Weather

  def feature
    "forecast10day"
  end

  def day_titles
    day_titles = []
    report["forecast"]["txt_forecast"]["forecastday"].each {|t| day_titles << t["title"]}
  end

  def day_forcasts
    day_forcasts = []
    report["forecast"]["txt_forecast"]["forecastday"].each {|t| day_forcasts << t["fcttext"]}
    day_forcasts
  end
  
end
