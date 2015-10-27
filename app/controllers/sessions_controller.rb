class SessionsController < ApplicationController
  def new
  end

  def create
  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
  end
    redirect_to movies_path, "Welcome back, #{user.firstname}!"
  else
    render :new
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "Adios!"
  end

end
