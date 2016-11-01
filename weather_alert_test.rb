require 'minitest/autorun'
require 'minitest/pride'
require './weather_alert'
require 'webmock/minitest'

require 'active_support'
require 'active_support/core_ext'


class WeatherAlertTest < Minitest::Test
  def test_class_exists
    assert WeatherAlert 
  end

  def test_can_get_weather_alert
    stub_request(
      :get,
      "http://api.wunderground.com/api/370f0daf09ad3f12/alert/q/59261.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/saco_montana_alert.json"),
      :headers => {'Content-Type' => 'application/json'}
    )
    #Weather.new.get("DC","Washington")
    WeatherAlert.new.get_by_zip("59261")

  end

end
