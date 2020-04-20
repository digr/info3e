class SessionsController < ApplicationController
  layout "login"

  skip_before_action :authorized, only: [:new, :create]

  def new
    if logged_in?
      redirect_to "/"
    end
    @auth_failed = false
  end

  def create
    params.require([:username, :password]).each { _1.strip! }

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
      @auth_failed = true
      render :new
    end
  rescue ActionController::ParameterMissing
      @auth_failed = true
      render :new    
  end

  def logout
    session[:user_id] = nil
    session[:admin] = nil
    redirect_to '/'
  end

end
