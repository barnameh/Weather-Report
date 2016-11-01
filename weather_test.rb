require 'minitest/autorun'
require 'minitest/pride'
require './weather'
require 'webmock/minitest'

require 'active_support'
require 'active_support/core_ext'


#sunrise, sunset
#http://api.wunderground.com/api/370f0daf09ad3f12/astronomy/q/20037.json

#alerts
#http://api.wunderground.com/api/370f0daf09ad3f12/alerts/q/20037.json



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
      :body => File.read("responses/foggy_bottom.json"),
      :headers => {'Content-Type' => 'application/json'}
    )
    #Weather.new.get("DC","Washington")
    Weather.new.get_by_zip("20037")

  end

end
