class CategoriesController < ApplicationController

    def index
        categories = Category.all 
        render json: categories
    end
    
    def create 
        category = Category.new(category_params)
        if category.save
            render json: category
        else
            render json: {status: 500, errors: ['category not found']}
        end
    end 

    def show
        category = Category.find(params[:id])
        render json: category
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end
end 