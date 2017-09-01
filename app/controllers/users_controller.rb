class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.filter_users(params[:search2])
  end

  def show
    @user = User.find(params[:id])
    @technologies = @user.technologies
  end

  def edit
    @user = User.find(params[:id])
    @technologies = Technology.filter_tech(@user)
    @levels = Level.all.map{|u| [u.name, u.id]}
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "edited"
      redirect_to users_path
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name)
    end
end
