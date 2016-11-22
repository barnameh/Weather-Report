require 'bundler/setup'
require 'httparty'
require 'pry'
require_relative 'weather'


class WeatherAlerts < Weather

  def feature
    "alerts"
  end

  def number_of_alerts
    report["alerts"].count
  end

  def descriptions
    descriptions = []
    report["alerts"].each { |a| descriptions << a["description"]}
    descriptions
  end

  def from_dates
    from_dates = []
    report["alerts"].each { |a| from_dates << a["date"]}
    from_dates
  end

  def expire_dates
    expire_dates = []
    report["alerts"].each { |a| expire_dates << a["expires"]}
    expire_dates
  end

  def messages
    messages = []
    report["alerts"].each { |a| messages << a["message"]}
    messages
  end

end
