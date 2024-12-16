# Rails Weather Checking Application

This is a basic app that reaches out the OpenWeaterhMap API to collect weather for a particular address. Caching for requests is handled by the Rails page partial caching. The zip code is extracted from the address and the OpenWeatherMap API geocodes the address based on the address zip and determines the lat/lon for the weather using the geocoding results.

Basic tests have been written to confirm that the view is loading correctly and that the initial state for the views match the expected defaults.

This app was developed using Rails 7.1 and tested on Ruby 3.2.2, but should be functional with Ruby 2.

#### REQUIREMENTS:
You will need to register with Open Weather Map and aquire an API Key through them:
https://openweathermap.org/


#### RUNNING THE APP:
To run the tests, check out the app and run:

```
cd weather_tracker
export WEATHER_API_KEY=your-api-key #Establish your API Key for the environment
rails test
```

To fire up the application to check weather for an address, run
```
rails s
```

Then visit http://localhost:3000 and enter an address in the 'Check Weather At' text field.

A basic SQLite Database file is included with the app so no data migration should be nessecary.

Next Steps
Ther are a number of enhancements that I would expect to take as next steps for the system:

1. RSpec Tests. While they take a little extra time to configure, I find RSpec to offe a lot more testing functionality than the base Rails testing libaries
2. Activity Loging. A database could be established to log the most commonly searched addresses to provide strategies to enhance the application longer-term.
3. Expanded Address handling. Using the address logging, analysist into what the most common addresses searched for could be done and any unexpected addresses could be given more robust parsing and handling.
4. Additional weather information could be displayed. User requests could be collected to determine what sorts of weather details would be most useful for them.

