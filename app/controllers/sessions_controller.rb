class SessionsController < ApplicationController
  layout "login"

  skip_before_action :authorized, only: [:new, :create]

  def new
    if logged_in?
      redirect_to "/"
    end
  end

  def create
    admin_name = Rails.env.production? ? ENV["ADMIN_NAME"] : "admin"
    admin_pass = Rails.env.production? ? ENV["ADMIN_PASS"] : "admin"

    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    elsif admin_name && 
          params[:username] == admin_name && 
          admin_pass && 
          params[:password] == admin_pass

      session[:admin] = true

      redirect_to "/"
    else
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    session[:admin] = nil
    redirect_to '/'
  end
end
