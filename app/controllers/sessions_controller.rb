class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome #{user.username}!"
    else
      redirect_to login_path, alert: "Invalid password or username!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, alert: "Logged out!"
  end
end
