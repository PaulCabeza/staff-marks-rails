class HomeController < ApplicationController
  def index
    @latitude = request.location.latitude
    @longitude = request.location.longitude
    @coordinates = request.location.coordinates
    @ip_address = request.location.ip_address
    @ip_coordinates = Geocoder.search(@ip_address).coordinates
  end
end
