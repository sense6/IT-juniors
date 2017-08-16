class UsersController < ApplicationController
  def index
    @users = User.filter_users(params[:search])
  end

  def show
  end

  def edit
  end
end
