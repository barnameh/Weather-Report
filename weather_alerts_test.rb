require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'
require 'pry'
require_relative 'weather_alerts'

class WeatherAlertsTest < Minitest::Test

  def test_class_exists
    assert WeatherAlerts
  end

  def test_can_get_weather_alert
    stub_request(
      :get,
      "http://api.wunderground.com/api/#{ENV['WEATHER_UNDERGROUND_API_KEY']}/alerts/q/20037.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/foggy_bottom_alerts.json"),
      :headers => {'Content-Type' => 'application/json'}
    )

    saco_alert = WeatherAlerts.new("20037")
    assert_equal "Lake Wind Advisory", saco_alert.descriptions[0]
  end

end
