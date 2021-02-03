class NeighborhoodsController < ApplicationController
    def index 
        neighborhoods = Neighborhood.all
        render json: neighborhodds
    end

    def show 
        @neighborhood = Neighborhood.find(params[:id])
        if @neighborhood
            render json: @neighborhood
        else 
            render json: { status: 500, errors: ["neighborhood not found"]}
        end 
    end

    def create
        @neighborhood = Neighborhood.new(neighborhood_params)
        if @neighborhood.save 
            render json: {status: "created", neighborhood: @neighborhood}
        else 
            render json: {status: 500, errors: @neighborhood.errors.full_messages}
        end
    end

    private

    def neighborhood_params 
        params.require(:neighborhood).permit(:name, :city, :state, :zipcode)
    end

end