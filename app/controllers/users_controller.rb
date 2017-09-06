class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.filter_users(params[:search2])
  end

  def show
    @user = User.find(params[:id])
    @technologies = @user.technologies
    @user_applied_offers = @user.applied_offers.decorate rescue nil
  end

  def edit
    @user = User.find(params[:id])
    @technologies = Technology.filter_user_technologies(@user)
    @levels = Level.all
    @offers = @user.company.offers.decorate rescue nil
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "edited"
      redirect_to user_path
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name)
    end
end
