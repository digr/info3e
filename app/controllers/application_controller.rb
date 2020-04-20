class ApplicationController < ActionController::Base
  before_action :authorized

  helper_method :logged_in?
  helper_method :admin?
  helper_method :teacher?
  helper_method :current_username
  helper_method :current_user_info

  around_action :set_time_zone

  def set_time_zone
    if logged_in?
      Time.use_zone("Europe/Moscow") { yield }
    else
      yield
    end
  end

  def current_username
    if admin?
      "Администратор"
    elsif teacher?
      "Учитель #{current_user_info.fullname}"
    elsif user?
      "Ученик #{current_user_info.fullname}"
    else
      nil
    end
  end

  def admin?
    !session[:admin].nil?
  end

  def user?
    !current_user_info.nil?
  end

  def current_user_info
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    user? || admin?
  end

  def teacher?
    user? && current_user_info.teacher?
  end

  def authorized
    redirect_to "/sessions/new" unless logged_in?
  end

  def authorized_admin
    not_found unless admin?
  end

  def authorized_teacher
    not_found unless teacher?
  end

  def not_found
    raise ActionController::RoutingError.new("Not Found")
  end

  def setup_date(date_param_name)
    @date = Date.parse(params[date_param_name]) rescue Date.today
    @date_i18 = I18n.l(@date, format: "%A, %-d %b %Y", locale: :'ru')
    @today_str = case @date
      when Date.today
        "сегодня, "
      when Date.tomorrow
        "завтра, "
      when Date.yesterday
        "вчера, "
      else
        ""
      end
  end
end
