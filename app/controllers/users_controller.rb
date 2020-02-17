class UsersController < ApplicationController
    before_action :login_required, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            redirect_to root_path
        end
    end

    def show
        @user = User.find(params[:id])
        render :show_admin if @user.admin == true
    end

    private

    def user_params
        params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password)
    end

end