class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def login
    user = User.find_by_username[username: params[:user][:username]]
    if user && user.password == params[:user][:password]
      session[:user_id] = user.id
      redirect_to root_path
    elsif user && user.password != params[:user][:password]
      flash[:login_error] = "Incorrect username & password.  Please try again."
      redirect_to root_path
    else
      flash[:login_error] = "Username not found.  Please try again."
      redirect_to root_path
    end
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

  def end
    session.clear
    redirect_to root_path
  end
end