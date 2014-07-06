require 'patron'

module Google
  module Elevation
    class Api

      def api_key
        @api_key ||= ENV['ELEVATION_KEY']
      end

      def get_elevation(latitude, longitude, format='json')
        url = "https://maps.googleapis.com/maps/api/elevation/#{format}?key=#{api_key}&locations=#{latitude},#{longitude}"
        session = Patron::Session.new
        JSON.parse(session.get(url).body)['results'].first['elevation']
      end

    end
  end
end