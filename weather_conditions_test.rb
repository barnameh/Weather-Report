require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'
require 'pry'
require_relative 'weather_conditions'


class WeatherConditionsTest < Minitest::Test

  def test_class_exists
    assert WeatherConditions
  end

  def test_can_get_weather_condition
    stub_request(
      :get,
      "http://api.wunderground.com/api/#{ENV['WEATHER_UNDERGROUND_API_KEY']}/conditions/q/20037.json"
    ).to_return(
      :status => 200,
      :body => File.read('responses/foggy_bottom_conditions.json'),
      :headers => {'Content-Type' => 'application/json'}
    )

    fb_conditions = WeatherConditions.new('20037')
    #binding.pry
    assert_equal "Washington, DC", fb_conditions.location

  end

end
