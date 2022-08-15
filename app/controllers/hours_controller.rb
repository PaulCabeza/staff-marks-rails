class HoursController < ApplicationController
    def index
        @q = Mark.ransack(params[:q])
        @cards = @q.result()
        @total_seconds = 0
        @hours_counter = DateTime.new

        @diferencia_de_horas = DateTime.now
        @total_de_horas = DateTime.new

        # @cards.each do |card|
        #     if card.datetime_out?
        #         @diferencia_de_horas = Time.at(card.datetime_out - card.created_at)
        #         @total_de_horas = Time.at(@total_de_horas + @diferencia_de_horas)
        #     end

        # end


        # @cards = @q.result(distinct: true)
        # @cards = Mark.all.order(created_at: :desc)
    end
end