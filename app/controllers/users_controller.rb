class UsersController < ApplicationController

    def index
        if params[:query]
            users = User.where("username LIKE ?", "%#{params[:query]}%")
        else
            users = User.all
        end
        if users.length > 0 
            render json: users
        else
            render json: "USER NOT FOUND"
        end
    end

    def create
        user = User.new(user_params)
        if user.save!
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id])

        if user 
            render json: user
        else
            render json: "No user found"
        end
        
    end

    def update
        user = User.find_by(id: params[:id])

        if user.update_attributes(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user
            user.destroy
            render json: "Successfully deleted"
        else
            render json: "User not found"
        end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end