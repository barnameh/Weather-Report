require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'
require 'pry'
require_relative 'weather_alert'

class WeatherAlertTest < Minitest::Test

  def test_class_exists
    assert WeatherAlert
  end

  def test_can_get_weather_alert
    stub_request(
      :get,
      "http://api.wunderground.com/api/#{ENV['WEATHER_UNDERGROUND_API_KEY']}/alerts/q/59261.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/saco_montana_alert.json"),
      :headers => {'Content-Type' => 'application/json'}
    )

    saco_alert = WeatherAlert.new("59261")
    assert_equal "Lake Wind Advisory", saco_alert.descriptions[0]
  end

end
