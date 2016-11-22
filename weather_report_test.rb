require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'webmock/minitest'
require_relative 'weather_report'

class WeatherReportTest < Minitest::Test
  class ::WeatherReport
    def get_zip
      "20877"
    end
  end

  def setup
    stub_for_zip("20037", "conditions", "responses/foggy_bottom_conditions.json")
    stub_for_zip("59261", "alerts", "responses/saco_montana_alerts.json")
    stub_for_zip("20037", "astronomy", "responses/foggy_bottom_sunrise_sunset.json")
    stub_for_zip("20037", "forecast10day", "responses/foggy_bottom_ten_day.json")
  end

  def test_asks_for_a_zip_code_and_reports_weather
    assert_output(/Please enter your desired zip code/) do |msg|
      WeatherReport.new.run!
    end
  end

  def test_tells_us_10_day_forecast
    assert_output(/Tuesday: Chance of a morning shower/) do |msg|
      WeatherReport.new.run!
    end
  end

  def stub_for_zip(zip, report_type, report_file)
    stub_request(
      :get,
      "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/#{report_type}/q/#{zip}.json"
    ).to_return(
      :status => 200,
      :body => File.read("#{report_file}"),
      :headers => { 'Content-Type' => 'application/json'}
    )
  end

end
