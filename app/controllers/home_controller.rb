class HomeController < ApplicationController
  def index
    @latitude = request.location.latitude
    @longitude = request.location.longitude
  end
end
