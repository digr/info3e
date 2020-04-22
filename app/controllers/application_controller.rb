class ApplicationController < ActionController::Base
  before_action :authorized

  helper_method :logged_in?

  helper_method :admin?
  helper_method :teacher?
  helper_method :student?

  helper_method :current_user_info
  helper_method :username
  helper_method :user_fullname

  helper_method :date
  helper_method :date_i18
  helper_method :today_str

  around_action :set_time_zone

  def set_time_zone
    if logged_in?
      Time.use_zone("Europe/Moscow") { yield }
    else
      yield
    end
  end

  def user_fullname
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

  def username
    current_user_info.username
  end

  def logged_in?
    user? || admin?
  end

  def teacher?
    user? && current_user_info.teacher?
  end

  def student?
    ! teacher?
  end

  def authorized
    redirect_to :sessions_new unless logged_in?
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

  def date(d = nil)
    Date.parse(d || session[:start_date])
  end

  def date_i18(d = nil)
    I18n.l(date(d), format: "%A, %-d %b %Y", locale: :'ru')
  end

  def today_str
    case date
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

  def reset_date
    session[:start_date] = nil
  end
end
