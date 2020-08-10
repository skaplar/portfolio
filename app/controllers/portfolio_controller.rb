class PortfolioController < ApplicationController

    def new
    end

    def create
        render plain: params[:portfolio].inspect
    end

    def show
    end
end
