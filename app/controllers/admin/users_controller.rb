require 'pry'
class Admin::UsersController < ApplicationController

  before_filter :admin_view

  def index
    @users = User.order(:firstname).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # session[:user_id] = @user.id
      redirect_to admin_users_path,notice: "User #{@user.firstname} has been created!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.destroy
        UserMailer.goodbye_email(@user)
        format.html {redirect_to(@user, notice: 'user was successfully deleted')}
        format.html {render action 'destroy'  }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end
end
