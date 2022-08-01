class HoursController < ApplicationController
    def index
        @cards = Mark.all.order(created_at: :desc)
    end
end