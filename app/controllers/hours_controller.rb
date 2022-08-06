class HoursController < ApplicationController
    def index
        @q = Mark.ransack(params[:q])
        @cards = @q.result()
        # @cards = @q.result(distinct: true)
        # @cards = Mark.all.order(created_at: :desc)
    end
end