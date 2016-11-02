require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'
require_relative 'weather_sunrise'

class WeatherSunriseTest < Minitest::Test
  def test_class_exists
    assert WeatherSunrise
  end

  def test_can_get_weather_sunrise
    stub_request(
      :get,
      "http://api.wunderground.com/api/#{ENV['WEATHER_UNDERGROUND_API_KEY']}/astronomy/q/20037.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/foggy_bottom_sunrise_sunset.json"),
      :headers => {'Content-Type' => 'application/json'}
    )

    fb_sunrise = WeatherSunrise.new("20037")
    assert_equal "7:34", fb_sunrise.sunrise

  end

end
