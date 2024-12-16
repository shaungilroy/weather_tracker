class WeatherController < ApplicationController

  def index
    api_key = ENV['WEATHER_API_KEY']

    query_postal_code = "97402"
    if params[:search_address]
      address_to_code = StreetAddress.parse( params[:search_address] ) rescue nil
      query_postal_code = address_to_code['zip'] unless address_to_code.nil? 
    end

    geocode = GeocodeApi.new(api_key)
    api = WeatherApi.new(api_key)

    @geocode = geocode.geocode_postal_code(query_postal_code)
    @geocoded_weather = api.weather_by_geocode(@geocode['lat'], @geocode['lon']) if @geocode['zip']
    @geocoded_forecast = api.forecast_by_geocode(@geocode['lat'], @geocode['lon']) if @geocode['zip']
  end

end
