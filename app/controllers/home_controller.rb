class HomeController < ApplicationController
  def index
    @latitude = request.location.city
    @longitude = request.location.country_code
  end
end
