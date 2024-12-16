require 'httparty'

class GeocodeApi
  include HTTParty
  base_uri 'https://api.openweathermap.org/geo/1.0/'

  def initialize(api_key)
    @options = { query: { appid: api_key } }
  end

  def geocode_postal_code(postal_code)
    # Restricting to US for simplicity
    self.class.get("/zip?zip=#{postal_code},US", @options)
  end

end
