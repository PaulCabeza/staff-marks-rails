class UsersController < ApplicationController
  def index
    @users = User.where(staff: false)
  end

  def cards
  	@pagy, @cards =  pagy(Mark.where(user_id: params[:id]).order(created_at: :desc))
  	@employee = User.find_by(id: params[:id])
  end

end
