require 'minitest/autorun'
require 'minitest/pride'
require './weather_condition'
require 'webmock/minitest'

require 'active_support'
require 'active_support/core_ext'


class WeatherConditionTest < Minitest::Test
  def test_class_exists
    assert WeatherCondition
  end

  def test_can_get_weather_condition
    stub_request(
      :get,
      "http://api.wunderground.com/api/370f0daf09ad3f12/conditions/q/20037.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/foggy_bottom_conditions.json"),
      :headers => {'Content-Type' => 'application/json'}
    )
    WeatherCondition.new.get_by_zip("20037")

  end

end
