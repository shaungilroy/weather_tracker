require 'httparty'

class WeatherApi
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  def initialize(api_key)
    # Setting Imperial measurements to get Farenheight and MPH measurements
    @options = { query: { appid: api_key, units: 'imperial' } }
  end

  def weather_by_geocode(lat, lon)
    self.class.get("/weather?lat=#{lat}&lon=#{lon}", @options)
  end

  def forecast_by_geocode(lat, lon)
    self.class.get("/forecast?lat=#{lat}&lon=#{lon}", @options)
  end

end

