class Weather
  attr_reader :zip_code, :report

  BASE_URI = "http://api.wunderground.com/api/#{ENV['WEATHER_UNDERGROUND_API_KEY']}/"

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def report
    @_report ||=  HTTParty.get("#{BASE_URI}#{feature}/q/#{zip_code}.json")
  end

  def feature
    raise 'Subclasses of Weather must define a feature method!'
  end
end
