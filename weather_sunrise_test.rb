require 'minitest/autorun'
require 'minitest/pride'
require './weather_sunrise'
require 'webmock/minitest'

require 'active_support'
require 'active_support/core_ext'

class WeatherSunriseTest < Minitest::Test
  def test_class_exists
    assert WeatherSunrise
  end

  def test_can_get_weather_sunrise
    stub_request(
      :get,
      "http://api.wunderground.com/api/370f0daf09ad3f12/astronomy/q/20037.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/foggy_bottom_sunrise_sunset.json"),
      :headers => {'Content-Type' => 'application/json'}
    )
    WeatherSunrise.new.get_by_zip("20037")

  end

end
