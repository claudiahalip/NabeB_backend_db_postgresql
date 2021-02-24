class ProfilephotosController < ApplicationController 

    def index 
        profilephotos = Profilephoto.all
        render json: {profilephotos: profilephotos}

    end

    def create
        photo = Cloudinary::Uploader.upload(params[:image])
        render json: photo
        profilephoto = Profilephoto.create({image: photo, user_id: profilephoto_params[:user_id]})
        if profilephoto.save 
            render json: {profilephoto: profilephoto}
        else 
            render json: {status: 500, errors: @user.errors.full_messages}
        end
    end

    def show
        profilephoto = Profilephoto.find(profilephotos_params[:id])
        if profilephoto
            render json: {profilephoto: profilephoto}
        else
            render json: {status: 500, errors: ['profile photo not found']}
        end
    end 
     
    def destroy
        profilephoto = Profilephoto.find(profilephotos_params[:id])
        profilephoto.clear

    end 

    private

    def profilephotos_params
       params.require(:profilephoto).require(:image, :user_id)
    end
end 