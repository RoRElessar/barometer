require 'barometer/weather_services/weather_bug/response/timezone'
require 'barometer/weather_services/weather_bug/response/current_weather'
require 'barometer/weather_services/weather_bug/response/station'

module Barometer
  module WeatherService
    class WeatherBug
      class CurrentResponse
        def initialize
          @response = Barometer::Response.new
        end

        def parse(payload)
          response.add_query(payload.query)

          response.timezone = WeatherBug::Response::TimeZone.new(payload).parse
          response.current = WeatherBug::Response::CurrentWeather.new(payload, timezone).parse
          response.station = WeatherBug::Response::Station.new(payload).parse

          response
        end

        private

        attr_reader :response

        def timezone
          response.timezone
        end
      end
    end
  end
end
