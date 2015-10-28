class Admin::UsersController < ApplicationController

  before_filter :admin_view

  def index
    @users = User.order(:firstname).page(params[:page]).per(10)
  end

end
