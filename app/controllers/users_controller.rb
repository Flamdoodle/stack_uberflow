class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end