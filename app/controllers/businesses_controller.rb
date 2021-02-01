class BusinessesController < ApplicationController 

    def index 
        businesses = Business.all
        render json: {businesses: businesses}
    end

    def show 
        business = Business.find(params[:id])
        if business
            render json: business
        else
            render json: {status: 500, errors: "this business doesn't exist"}
        end
    end 

    def create 
        @business = Business.new(business_params)
        if @business.save
            render json: @business
        else
            render json: {status:500, erros: @business.errors.full_messages}
        end
    end

    def update 
        business = Business.find(params[:id])
        business.update(business_params)
        render json: business
    end 

    private 
    def business_params
        params(:business).require(:name,:description, :website, :phone_number, :user_id, :category_id, :neighborhood_id )
    end


end 
