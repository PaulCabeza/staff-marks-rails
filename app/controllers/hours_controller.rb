class HoursController < ApplicationController
    def index
        @q = Mark.ransack(params[:q])
        @cards = @q.result()
        @total_seconds = 0
        @hours_counter = DateTime.new

        @diferencia_de_horas = DateTime.now
        @total_de_horas = DateTime.new        
    end

    def search
        index
        render :index
    end

end