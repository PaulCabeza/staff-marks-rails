class HomeController < ApplicationController
  def index
    @latitude = request.location.latitude
    @longitude = request.location.longitude
    @coordinates = request.location.coordinates
  end
end
