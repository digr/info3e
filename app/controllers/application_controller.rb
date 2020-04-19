class ApplicationController < ActionController::Base
  before_action :authorized

  helper_method :current_username

  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_username
    if admin?
      "Administrator"
    else
      current_user.fullname || current_user.username
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    !session[:admin].nil?
  end

  def authorized
    redirect_to '/sessions/new' unless logged_in?
  end  

  def authorized_admin
    not_found unless admin?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
