require 'faraday'
require 'faraday/net_http'
require 'json'
Faraday.default_adapter = :net_http


class MarksController < ApplicationController
  before_action :set_mark, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /marks or /marks.json
  def index
    @pagy, @marks = pagy(Mark.where(user_id: current_user).order(created_at: :desc))
  end

  # GET /marks/1 or /marks/1.json
  def show
  end

  # GET /marks/new
  def new
    @mark = Mark.new
    response = Faraday.get('https://orders-mgmt-app.herokuapp.com/pos_list')
    @data = JSON.parse response.body
  end

  # GET /marks/new
  def new_out
    @mark = Mark.find_by(id: params[:id])
  end

  def card_out_add
    @mark = Mark.find_by(id: params[:id])
    @mark.datetime_out = DateTime.now    
    @mark.completed = true
    respond_to do |format|
      if @mark.update(mark_params)
        format.html { redirect_to mark_url(@mark), notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
    

  end

  # GET /marks/1/edit
  def edit
  end

  # POST /marks or /marks.json
  def create
    # @latitude = mark_params[:latitude]
    # @results = Geocoder.search("Paris")
    # @results.first.coordinates

    @mark = Mark.new(mark_params)    

    geo_localization = "#{@mark.latitude_in},#{@mark.longitude_in}"
    query = Geocoder.search(geo_localization).first
    if query.present?
      @mark.address_in = query.address
    end

    respond_to do |format|
      if @mark.save
        format.html { redirect_to mark_url(@mark), notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @mark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marks/1 or /marks/1.json
  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.html { redirect_to mark_url(@mark), notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1 or /marks/1.json
  def destroy
    @mark.destroy

    respond_to do |format|
      format.html { redirect_to marks_url, alert: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark
      @mark = Mark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mark_params
      params.require(:mark).permit(:mark_type, :latitude_in, :longitude_in, :address_in, :user_id, :purchaseorder, :latitude_out, :longitude_out)
    end
end
