require 'patron'

module Google
  module Elevation
    class Api

      def api_key
        @api_key ||= ENV['ELEVATION_KEY']
      end

      def get_elevation(latitude, longitude, format='json')
        # location format: {lat,lng}
        url = "https://maps.googleapis.com/maps/api/elevation/#{format}?key=#{api_key}&locations=#{latitude},#{longitude}"
        session = Patron::Session.new
        session.get(url).body
      end

    end
  end
end