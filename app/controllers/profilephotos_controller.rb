class ProfilephotosController < ApplicationController 

    def index 
        profilephotos = Profilephoto.all
        render json: {profilephotos: profilephotos}

    end

    def create
    end

    def show
        
    end 
     
    def destroy

    end 
end 