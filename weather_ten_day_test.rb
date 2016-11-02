require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'\
require 'pry'
require_relative 'weather_ten_day'



class WeatherTest < Minitest::Test
  def test_class_exists
    assert Weather
  end

  def test_can_get_weather
    stub_request(
      :get,
      "http://api.wunderground.com/api/370f0daf09ad3f12/forecast10day/q/20037.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/foggy_bottom_ten_day.json"),
      :headers => {'Content-Type' => 'application/json'}
    )

    fb_ten_day = WeatherTenDay.new("20037")
    assert_equal "Partly cloudy. Lows overnight in the low 40s.", fb_ten_day.day_forcasts[0]

  end

end
