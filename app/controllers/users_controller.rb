class UsersController < ApplicationController
  def index
    @users = User.where(:staff == false )
  end
end
